
# Make File For Atmel Cpu MD Harrington Kent 
## Date 03/02/2024

## Initial  diagrams / Drawings you will need to follow this

Diagram of Uno Development Board 
![Arduino Pin Out ](Lesson1/Images/Arduino-Uno-Pin-Diagram.png)


Diagram of Atmel 328P Pin out  

![Atmel 328P Pin Out](Lesson1/Images/mainIC.png)



## Purpose of make file and what this does  
Makefiles are used to help decide which parts of a large program need to be recompiled. In the vast majority of cases, C or C++ files are compiled. Makefile  can be used to do many tasks other than just compile.  It can be used to preform stick standard bash tasks  well



The  Project includes  the following files   
A directory named C_Files and Directory named Header_files also 
the makefile  itself which is used to  compile the C  and header files to upload  
to the atmel  device 
  
The makefile  contains the following commands 

1: make  , this compliles all c  and header  files in the directories  named C_Files   && Header_files directories under Lesson1 producing the following files main.hex, main.elf, main.o, main , and main.s

2: make burn , this uploads the hex file to the Mcu using arduino ports  

3: make clean ,this uses basic  bash commands to remove all files in compilation   
apart from  any c files and header files contained in directories meantioned above 

4: To change the compilation to Lesson2  then  edit the make file lines 1 and 2  
This $(wildcard Lesson1/C_Files/*.c)  

should then be changed to   

$(wildcard Lesson2/C_Files/*.c)

The same applies to $(wildcard Lesson1/Header_Files/*.h)

This  should be changed to 

$(wildcard Lesson2/Header_Files/*.h)





## Installation

Install of source code to local drive 

```bash
   ## Assumning git installed  run  git clone < address of git repository >
   git clone git@github.com:markh2016/MakeFileForAtmelCpu.git
      
   ## cd in to  cloned directory 
   cd MakeFileForAtmelCpu
   
   ## now run make  from the command line 
   make 
   
   ## connect arduino , hopefully you wont have to modify port in ***Makefile***
   ## to upoad hex  from terminal run the command  make burn
   make burn 
   
   ## To clean the project  use the command from terminal ***make clean*** 
   ##  See below  this line  as how to 
   make clean 

```
    
# Features

## Here's a breakdown of what each part of the Makefile does:
```
target = main:   
Specifies the name of the output file.  

src_files = $(wildcard Lesson1/C_Files/*.c):   
Collects all C source files in the Lesson1/C_Files directory.  

header_files = $(wildcard Lesson1/Header_Files/*.h):   
Collects all header files in the Lesson1/Header_Files directory.

cpu_type = atmega328p:   
Specifies the default CPU type.  


.PHONY: all burn clean:   
Declares the all, burn, and clean targets as phony, meaning they are not actual files but rather targets for the Makefile.  

all: The default target. Depends on $(target).hex, $(target).elf, and $(target).s.

$(target).s: Generates assembly code from the source files.  

$(target).o: Compiles the source files into object files.  

$(target): Links the object files into an executable.

$(target).hex: Converts the executable into a hex file.

$(target).elf: Converts the executable into an ELF file.

burn: Flash the hex file to the AVR microcontroller using avrdude.

clean: Removes all generated files.

This Makefile assumes that you have the AVR toolchain (avr-gcc, avr-objcopy, avrdude) installed and configured correctly on your system, and that you have an AVR microcontroller connected to /dev/ttyUSB0.

```
## A more comprehensive break down   of how this makefile works  line by line of code 

![Im1](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/d65e31d6-e594-4fab-8230-97c459e5d08f)  
Sets the variable target to "main", which represents the name of the main target file without the file extension.  

![Im2](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/a00691be-1eb0-4297-9144-950918793774)  
Uses wildcard function to find all the C source files (*.c) in the source directory and assigns them to src_files.
Uses patsubst function to replace the .c extension with .o for each source file and assigns them to obj_files.  
This creates a list of corresponding object files.

![Im3](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/475444c9-7018-4878-a242-9fc49e08b1d7)  

Sets the variable cpu_type to specify the type of AVR microcontroller being used, in this case, it's atmega328p.

![Im4](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/cc31e52d-6927-4bc8-9cd2-579e1bd892e4)  

Sets the variables CC, OBJCOPY, and AVRDUDE to the commands for compiling (avr-gcc), object copying (avr-objcopy), 
and AVR programming (avrdude) respectively.  

![Im5](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/8ad26606-829a-47b0-8ab2-29e157e08f0f)  
Sets the CFLAGS variable which contains compiler flags:

    -I$(hdr_dir): Specifies the directory to search for header files.
    -mmcu=$(cpu_type): Specifies the AVR microcontroller type.
    -Os: Optimization flag for size.

![Im6](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/bb32015a-5cb4-4749-8575-3284dd1e4dac)  
Defines the default target all which depends on generating .hex, .elf, and .s files.  

![Im7](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/5a64a26b-fcd6-4612-aae3-44232a132737)  
Generates assembly code .s file from source files using the avr-gcc command.

![Im8](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/f1a1dcd3-4d12-4eae-ab44-b95665bd0b0a)  
Compiles each .c file in the source directory into an object file using avr-gcc.  

![Im9](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/83a117c9-96f5-41cd-8a64-53b21c0d5b8b)  
Links object files into the final target executable using avr-gcc.  

![Im10](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/e2589aa6-b519-483f-808f-c958e72adbb8)  
Converts the target executable into Intel HEX format using avr-objcopy.  

![Im11](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/d421b3e0-ed27-427d-b2f8-c2b0cf83f85e)  
Converts the target executable into ELF format using avr-objcopy.  

![Im12](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/3ba3c032-eddd-4367-848b-e7c889e351a4)  
Defines a target burn to upload the .hex file onto the AVR microcontroller using avrdude.  

![Im13](https://github.com/markh2016/AVR-gcc-Lessons/assets/16375330/6704f46c-b2f5-4e8e-98da-cc8504d6314d)  
Defines the clean target to remove all generated files and object files.













## Diagrams you will need  to follow this 
An excellent presentation  explaining the memory map with assember for the   
Atmel devices 

[MCU-Part03.pdf](https://github.com/markh2016/AVR-gcc-Lessons/files/14155371/MCU-Part03.pdf)  

Flow Charts For Lesson 1  
![Flow Chart for lesson1  ](Lesson1/Images/flowchartlesson1.png)  

The Layout showing how  you would link the components to the breadboard  with arduino

![Layout for Lesson1 and Lesson2 using fritzing](Lesson1/Images/Lesson1_Lesson2_layout.png)

Parts List for the Lesson 1 and Lesson2 
![Parts list for lesson 1 and Lesson 2 ](Lesson1/Images/PartsList.png) 

<!--- Comments are Fun [a relative link](other_file.md) --->




