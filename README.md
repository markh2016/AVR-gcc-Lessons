
# Make File For Atmel Cpu MD Harrington Kent 
## Date 03/02/2024

## Diagrams  you will require to  understand this  
The atmel device itself 

![Pin out of atmel 328P](https://github.com/markh2016/MakeFileForAtmelCpu/blob/main/Lesson1/Images/mainIC.png)  

The Arduino Board pin out
![Pin out of Arduino Uno](https://github.com/markh2016/MakeFileForAtmelCpu/blob/main/Lesson1/Images/Arduino-Uno-Pin-Diagram.png)



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

This Makefile is for compiling and flashing AVR microcontroller code written in C.  
Let's break down the components:
```


    Variables:
        target: Specifies the name of the main target file.
        src_dir: Specifies the directory where C source files are located.
        hdr_dir: Specifies the directory where header files are located.
        src_files: Contains a list of C source files in the source directory.
        obj_files: Contains a list of corresponding object files.
        cpu_type: Specifies the type of AVR microcontroller being targeted, defaulting to atmega328p.

    Phony Targets:
        all: The default target. It depends on $(target).hex, $(target).elf, and $(target).s, indicating that it will generate these files.
        burn: This target is for flashing the generated .hex file onto the microcontroller using avrdude.
        clean: Removes generated files and object files.

    Rules:
        .SUFFIXES: Specifies the rules for building .o files from corresponding .c files.
        all: Depends on $(target).hex, $(target).elf, and $(target).s.
        $(target).s: Generates assembly code from C source files.
        main.o: Compiles main.c file to generate the object file.
        $(obj_files): Compiles all source files into object files.
        $(target): Links the object files to generate the final executable.
        $(target).hex: Converts the executable to Intel HEX format.
        $(target).elf: Converts the executable to ELF format.
        burn: Depends on $(target).hex. It uses avrdude to flash the HEX file onto the microcontroller.
        clean: Removes all generated files and object files.

    Commands:
        avr-gcc: Invokes the AVR GCC compiler to compile C code and generate object files.
        avr-objcopy: Converts the executable to different formats.
        avrdude: The utility for programming AVR microcontrollers.

This Makefile provides a structured way to compile, link, and flash AVR microcontroller code using AVR GCC toolchain and avrdude.
```


## Diagrams you will need  to follow this 

This is still under edit  please be patiant 
