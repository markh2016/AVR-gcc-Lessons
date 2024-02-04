# Makefile for AVR project

# Define target name
target = main

# Directories
src_dir = Lesson1/C_Files
hdr_dir = Lesson1/Header_Files

# Source and object files
src_files := $(wildcard $(src_dir)/*.c)
obj_files := $(patsubst $(src_dir)/%.c,$(src_dir)/%.o,$(src_files))

# AVR microcontroller type
cpu_type = atmega328p

# Compiler settings
CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE = avrdude

# Compiler flags
CFLAGS = -I$(hdr_dir) -mmcu=$(cpu_type) -Os

# Target rules
all: $(target).hex $(target).elf $(target).s

$(target).s: $(src_files) $(hdr_dir)/*.h
	$(CC) $(CFLAGS) -S $(src_files) -o $(target).s

$(src_dir)/%.o: $(src_dir)/%.c $(hdr_dir)/*.h
	$(CC) $(CFLAGS) -c $< -o $@

$(target): $(obj_files)
	$(CC) $(CFLAGS) $^ -o $(target)

$(target).hex: $(target)
	$(OBJCOPY) -O ihex -R .eeprom $(target) $(target).hex

$(target).elf: $(target)
	$(OBJCOPY) -O elf32-avr -R .eeprom $(target) $(target).elf

burn: $(target).hex
	$(AVRDUDE) -F -V -c arduino -p $(cpu_type) -P /dev/ttyUSB0 -b 115200 -U flash:w:$(target).hex

clean:
	rm -f $(target) $(target).hex $(target).elf $(obj_files) $(target).s
