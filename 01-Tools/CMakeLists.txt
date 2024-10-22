#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    CMakeLists.txt                          #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    CMakeList.txt                           #######
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


##################################################################################################################################################################
##################################################################################################################################################################
##################################################################################################################################################################


############################ Directories Preparation ########################
### Set Directories
set(PROJECT_FOLDER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)
set(PROJECT_TOOLS_FOLDER_DIR ${PROJECT_FOLDER_DIR}/01-Tools)
set(PROJECT_SOURCE_FOLDER_DIR ${PROJECT_FOLDER_DIR}/02-Source)
set(PROJECT_LINKER_FOLDER_DIR ${PROJECT_FOLDER_DIR}/02-Source/01-Dep)
set(PROJECT_TEST_FOLDER_DIR ${PROJECT_FOLDER_DIR}/03-Tests)
set(PROJECT_EXECUTABLES_FOLDER_DIR ${PROJECT_FOLDER_DIR}/09-Build)







##################################################################################################################################################################
##################################################################################################################################################################
##################################################################################################################################################################

############################ Set Global Variables ########################
set(PROJECT_INCLUDE_FILES_EXTENSIONS "")
set(PROJECT_SOURCE_FILE_EXTENSIONS "")
set(PROJECT_ALL_FILES_EXTENSIONS "")



set(PROJECT_ALL_SOURCE_FILES    "")
set(PROJECT_ALL_HEADER_FILES    "")
set(PROJECT_COMPILER_INCLUDES "")
set(PROJECT_ALL_INCLUDE_DIRS    "")


set(PROJECT_DEFAULT_C_FLAGS   "")
set(PROJECT_DEFAULT_CXX_FLAGS   "")
set(PROJECT_DEFAULT_ASM_FLAGS  "")
set(PROJECT_DEFAULT_LINK_FLAGS  "")





############################ Set Build Folder directories ########################
### Include BuildFolder
include(${PROJECT_TOOLS_FOLDER_DIR}/BuildFolder.cmake)       




############################ Include Configurations ########################
### Include the config file
if(EXISTS ${PROJECT_SOURCE_FOLDER_DIR})
    include(${PROJECT_SOURCE_FOLDER_DIR}/01-Dep/Config.cmake)       
else()
    message(FATAL_ERROR "Invalid 'Config.cmake' directory")      
endif()


############################ Include default config file ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/DefaultConfig.cmake)       



############################ Get Extensions ########################
### Include GetExtensions
include(${PROJECT_TOOLS_FOLDER_DIR}/GetFunctions.cmake)     



############################ Get Extensions ########################
### Include GetExtensions
include(${PROJECT_TOOLS_FOLDER_DIR}/GetExtensions.cmake)     



############################ Include all supported files ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/FindFiles.cmake)   




############################ Generate directories ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/FilesStatus.cmake)   





############################ Compiler Settings ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/CompilerSettings.cmake)   



############################ Generate directories ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/CompilerStatus.cmake)   




############################ Compiler Settings ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/DebuggerSettings.cmake)   






############################ Target Settings ########################
### Include the config file
include(${PROJECT_TOOLS_FOLDER_DIR}/TargetSettings.cmake)   




