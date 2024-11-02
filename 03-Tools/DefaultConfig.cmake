 #[[########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    DefaultConfig.cmake                    #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    Default Cmake configurations            #######
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



############################ Cmake Version ########################
cmake_minimum_required(VERSION 3.28.0)



######################################## $PROJECT_NAME check   #######################################
### Set project name
if (NOT DEFINED PROJECT_NAME)
    set(PROJECT_NAME "SWC")
    # message(WARNING " !!!  PROJECT_NAME is undefined !!!")
endif()



######################################## $PROJECT_LANGUAGE check   #######################################
###  Set Language Specs
if (NOT DEFINED PROJECT_LANGUAGE)
    message(FATAL_ERROR " xxx  PROJECT_LANGUAGE  is undefined  xxx  ")
elseif (PROJECT_LANGUAGE STREQUAL "CXX")
    project(${PROJECT_NAME} VERSION 0.1.0 LANGUAGES C ASM CXX)
elseif (PROJECT_LANGUAGE STREQUAL "C")
    project(${PROJECT_NAME} VERSION 0.1.0 LANGUAGES C ASM)  
else()
    message(FATAL_ERROR "PROJECT_LANGUAGE : ${PROJECT_LANGUAGE} is Not Supported")
endif()



######################################## $PROJECT_LANGUAGE_VERSION check   #######################################
###  Set Language Specs
if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
    message(WARNING " !!!  PROJECT_LANGUAGE_VERSION is undefined  !!!")
elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
    set(CMAKE_CXX_STANDARD ${PROJECT_LANGUAGE_VERSION})
    set(CMAKE_CXX_STANDARD_REQUIRED True)
elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
    set(CMAKE_C_STANDARD ${PROJECT_LANGUAGE_VERSION})
    set(CMAKE_C_STANDARD_REQUIRED True)
endif()




######################################## $ARCHITECTURE check   #######################################
###  Set Architecture Specs
if (NOT DEFINED ARCHITECTURE)
    set(ARCHITECTURE "WINDOWS")
    message(WARNING " !!!  ARCHITECTURE is undefined , WINDOWS is selected  !!!  ")
endif()




######################################## $MICROCONTROLLER check   #######################################
###  Set Microcontroller Specs
if (NOT DEFINED MICROCONTROLLER)
    set(MICROCONTROLLER "")
    message(WARNING " !!!  MICROCONTROLLER is undefined , WINDOWS is selected !!!  ") 
endif()





######################################## $COMPILER_TYPE check   #######################################
###  Set Compiler Specs
if (NOT DEFINED COMPILER_TYPE)
    set(COMPILER_TYPE "WINDOWS")
    set(COMPILER_PATH "C:/msys64/ucrt64")
    message(WARNING " !!! COMPILER_TYPE is undefined, WINDOWS Comiler is selected  !!!  ")
endif()
######################################## $COMPILER_PATH check   #######################################
###  Set Compiler Specs
if (NOT DEFINED COMPILER_PATH)
    set(COMPILER_PATH "C:/msys64/ucrt64")
    message(WARNING " !!!  COMPILER_PATH is undefined, WINDOWS Comiler is used !!!")   
endif()

######################################## $DEBUGGER_TYPE check   #######################################
###  Set Compiler Specs
if (NOT DEFINED CMAKE_DEBUG_TOOL_TYPE)
    set(CMAKE_DEBUG_TOOL_TYPE "GDB")
    set(CMAKE_DEBUG_TOOL_PATH )
    message(WARNING " !!! CMAKE_DEBUG_TOOL_TYPE is undefined, GDB is selected  !!!  ")
endif()
######################################## $COMPILER_PATH check   #######################################
###  Set Compiler Specs
if (NOT DEFINED CMAKE_DEBUG_TOOL_PATH)
    set(CMAKE_DEBUG_TOOL_PATH )
    message(WARNING " !!!  CMAKE_DEBUG_TOOL_PATH is undefined, GDB is used !!!")   
endif()

######################################## $FLASH_TYPE check   #######################################
###  Set Compiler Specs
if (NOT DEFINED CMAKE_FLASH_TOOL_TYPE)
    set(CMAKE_FLASH_TOOL_TYPE "GDB")
    set(CMAKE_FLASH_TOOL_PATH )
    message(WARNING " !!! CMAKE_FLASH_TOOL_TYPE is undefined, GDB is selected  !!!  ")
endif()
######################################## $COMPILER_PATH check   #######################################
###  Set Compiler Specs
if (NOT DEFINED CMAKE_FLASH_TOOL_PATH)
    set(CMAKE_FLASH_TOOL_PATH )
    message(WARNING " !!!  CMAKE_FLASH_TOOL_PATH is undefined, GDB is used !!!")   
endif()




######################################## $ROM_SIZE check   #######################################
###  Set Microcontroller Specs
if (NOT DEFINED ROM_SIZE)
    set(ROM_SIZE 10000000)           # 10Mb
    message(WARNING " !!! ROM_SIZE  is undefined   !!!  ")
endif()







######################################## $RAM_SIZE check   #######################################
###  Set Microcontroller Specs
if (NOT DEFINED RAM_SIZE)
    set(RAM_SIZE 100000)            # 100 Kb
    message(WARNING " !!! RAM_SIZE  is undefined   !!!  ")
endif()






######################################## $PROJECT_CUSTOM_C_FLAGS check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_CUSTOM_C_FLAGS)
    set(PROJECT_CUSTOM_C_FLAGS )            
endif()
######################################## $PROJECT_CUSTOM_CXX_FLAGS check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_CUSTOM_CXX_FLAGS)
    set(PROJECT_CUSTOM_CXX_FLAGS )            
endif()
######################################## $PROJECT_CUSTOM_ASM_FLAGS check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_CUSTOM_ASM_FLAGS)
    set(PROJECT_CUSTOM_ASM_FLAGS )            
endif()
######################################## $PROJECT_CUSTOM_LINKER_FLAGS check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_CUSTOM_LINKER_FLAGS)
    set(PROJECT_CUSTOM_LINKER_FLAGS )            
endif()







######################################## $EXCLUDE_DIR check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_EXCLUDE_DIRS)
    set(PROJECT_EXCLUDE_DIRS )            
endif()
######################################## $PROJECT_EXCLUDE_FILES check   #######################################
###  Set Compiler Specs
if (NOT DEFINED PROJECT_EXCLUDE_FILES)
    set(PROJECT_EXCLUDE_FILES )            
endif()


