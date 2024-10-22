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




###############  Set Compiler options ###############
set(COMPILER_TYPE "WINDOWS")
set(COMPILER_VERSION "14.1.0")
set(COMPILER_PATH "C:/msys64/ucrt64")

# set(CMAKE_DEBUG_TOOL_PATH "C:/WinAVR-20100110/bin")
# set(CMAKE_DEBUG_TOOL_TYPE "AVRDUDE")
# set(CMAKE_FLASH_TOOL_PATH "C:/WinAVR-20100110/bin")
# set(CMAKE_FLASH_TOOL_TYPE "AVRDUDE")



###############  Set Compiler Flags ############### 
# set(CUSTOM_C_FLAGS  -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os )
# set(CUSTOM_CXX_FLAGS -fno-exceptions -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
# set(CUSTOM_ASM_FLAGS -C -G)
# set(CUSTOM_LINKER_FLAGS -C -Olink)



###############  Set Linker script file ############### 
set(LINKER_FILE linker_script.ld)






# #####  Set Microcontroller options ##### 
set(ARCHITECTURE "WINDOWS")
set(MICROCONTROLLER "WINDOWS")
set(ROM_SIZE 1MB)
set(RAM_SIZE 65K)



###############  Set Compiler Flags ############### 
# set(CUSTOM_C_FLAGS  -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
# set(CUSTOM_CXX_FLAGS -fno-exceptions -mmcu=$(MCU) -DF_CPU=$(F_CPU)UL -DBAUD=$(BAUD)  -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -ffunction-sections -fdata-sections -Wl,--gc-sections -Wl,--relax)
# set(CUSTOM_ASM_FLAGS -C -G)
# set(CUSTOM_LINKER_FLAGS -C -Olink)


###############  Set Linker script file ############### 
# set(LINKER_FILE linker_script.ld)









