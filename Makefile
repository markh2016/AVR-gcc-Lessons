target = main
src_dir = Lesson1/C_Files
hdr_dir = Lesson1/Header_Files
src_files := $(wildcard $(src_dir)/*.c)
obj_files := $(patsubst $(src_dir)/%.c,%.o,$(src_files))
cpu_type = atmega328p  # Default CPU type

.PHONY: all burn clean

all: $(target).hex $(target).elf $(target).s

$(target).s: $(src_files) $(hdr_dir)/*.h
	avr-gcc -S -mmcu=$(cpu_type) $(src_files) -o $(target).s

main.o: $(src_dir)/main.c
	avr-gcc -c -mmcu=$(cpu_type) $< -o $@

$(obj_files): $(src_dir)/%.o: $(src_dir)/%.c
	avr-gcc -c -mmcu=$(cpu_type) $< -o $@

$(target): $(obj_files)
	avr-gcc -mmcu=$(cpu_type) $^ -o $(target)

$(target).hex: $(target)
	avr-objcopy -O ihex -R .eeprom $(target) $(target).hex

$(target).elf: $(target)
	avr-objcopy -O elf32-avr -R .eeprom $(target) $(target).elf

burn: $(target).hex
	avrdude -F -V -c arduino -p $(cpu_type) -P /dev/ttyUSB0 -b 115200 -U flash:w:$(target).hex

clean:
	rm -f $(target) $(target).hex $(target).elf $(obj_files) $(target).s
