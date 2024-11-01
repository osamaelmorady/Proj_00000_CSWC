 #[[########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    Config.cmake                            #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    User Cmake configurations               #######
   #######       Scope  :    Public                                  #######
   #######       Coding language : CMake                             #######
   #######       Designed by     : Osama ElMorady                    #######
   #######       Copyright (c)   AstreTech                           #######
   #########################################################################
#]]
#[[#####################################################################################################################################################
   ######################################################## MODIFICATION LOG SECTION ###################################################################
   #####################################################################################################################################################
   |  ::    Author              | Version              | Date                   |    Status        |       Description                   |
   |  :: :-------------------:  | :------------------: | :--------------------: | :----------      | :---------------------------------: |
   |  $Author:: Osama ElMorady  | $Version::  1.0      | $Date:: 18 Oct,2024    | $Status:: Draft  | $Description::  Initial Commit      |          
   #####################################################################################################################################################
 #]]


#################### Set Language #################### 
 #[[##    Range [C , CXX]     #]]
set(PROJECT_LANGUAGE "CXX")

 #[[##   Range [90, 99, 11 , 17]     #]]
set(PROJECT_LANGUAGE_VERSION "11")


################ Set project type, Name ############### 
set(PROJECT_NAME "SWC")




###############  Directory, Files Exclusion  ###############
set(EXCLUDE_DIRS  )
set(EXCLUDE_FILES  )




#################  Set Microcontroller options ################# 
#[[##    Range [ WINDOWS, AVR, ARM , RL78, R8C ]     #]]
set(ARCHITECTURE "WINDOWS")


#[[##    Range [ eg. atmega32, f5f11 , stm32 ]     #]]
set(MICROCONTROLLER "atmega32")
set(ROM_SIZE 1MB)
set(RAM_SIZE 65K)



###############  Set Compiler options ###############
#[[##    Range [ GCC-MINGW ,  GCC-AVR , GCC-ARM , GCC-RL78 ]     #]]
set(COMPILER_TYPE "GCC-MINGW")

#[[##    Range [ Not Supported yet ]     #]]
set(COMPILER_VERSION "14.1.0")

#[[##    Range [ Your compiler path ]     #]]
set(COMPILER_PATH "C:/msys64/ucrt64")




###############  Set Debbugger options ###############
#[[##    Range [ GDB , AVRDUDE , OpenOCD , ST-LINK , J-Link , pyOCD ]     #]]
set(CMAKE_DEBUG_TOOL_TYPE "GDB")


#[[##    Range [ Your Debbugger path ]     #]]
set(CMAKE_DEBUG_TOOL_PATH "C:/msys64/mingw64/bin")




###############  Set Flasher options ###############
#[[##    Range [ GDB , USBASP , ST-LINK , E2-LITE , J-Link , OpenOCD , pyOCD ]     #]]
set(CMAKE_FLASH_TOOL_TYPE "GDB")


#[[##    Range [ Your Flasher path ]     #]]
set(CMAKE_FLASH_TOOL_PATH "C:/msys64/mingw64/bin")




###############  Set Compiler Flags ############### 
set(PROJECT_CUSTOM_C_FLAGS  -mmcu=$(MCU) -fno-exception -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
set(PROJECT_CUSTOM_CXX_FLAGS  -mmcu=$(MCU) -fno-exceptions -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
set(PROJECT_CUSTOM_ASM_FLAGS )
set(PROJECT_CUSTOM_LINKER_FLAGS -ffunction-sections  -fsigned-char -fdata-sections -flto -Wall -Xlinker --gc-sections -lole32 -ladvapi32)



###############  Set Linker script file ############### 
# set(PROJECT_LINKER_FILE linker_script.ld)
set(PROJECT_LINKER_FILE i386pep.x)

















