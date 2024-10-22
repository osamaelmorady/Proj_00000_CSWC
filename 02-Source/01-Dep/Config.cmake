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
set(PROJECT_LANGUAGE "CXX")
set(PROJECT_LANGUAGE_VERSION "11")


################ Set project type, Name ############### 
set(PROJECT_NAME "SWC")




###############  Directory, Files Exclusion  ###############
set(EXCLUDE_DIRS  )
set(EXCLUDE_FILES  )




# #####  Set Microcontroller options ##### 
set(ARCHITECTURE "WINDOWS")
set(MICROCONTROLLER "WINDOWS")
set(ROM_SIZE 1MB)
set(RAM_SIZE 65K)



###############  Set Compiler options ###############
set(COMPILER_TYPE "WINDOWS")
set(COMPILER_VERSION "14.1.0")
set(COMPILER_PATH "C:/msys64/ucrt64")

###############  Set Debbugger options ###############
set(CMAKE_DEBUG_TOOL_PATH "C:/msys64/mingw64/bin")
set(CMAKE_DEBUG_TOOL_TYPE "GDB")
set(CMAKE_FLASH_TOOL_PATH "C:/msys64/mingw64/bin")
set(CMAKE_FLASH_TOOL_TYPE "GDB")



###############  Set Compiler Flags ############### 
set(PROJECT_CUSTOM_C_FLAGS -fno-exception -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
set(PROJECT_CUSTOM_CXX_FLAGS -fno-exceptions -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
set(PROJECT_CUSTOM_ASM_FLAGS )
set(PROJECT_CUSTOM_LINKER_FLAGS -ffunction-sections  -fsigned-char -fdata-sections -flto -Wall -Xlinker --gc-sections -lole32 -ladvapi32)



###############  Set Linker script file ############### 
# set(PROJECT_LINKER_FILE linker_script.ld)
set(PROJECT_LINKER_FILE i386pep.x)

















