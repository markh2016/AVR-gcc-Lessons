
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


## Diagrams you will need  to follow this 
[embed] https://github.com/markh2016/AVR-gcc-Lessons/blob/main/Notes/MCU-Part03.pdf [/embed]
