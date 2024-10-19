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
############################ Include Configurations ########################
### Include the directories settings file
include(DirectorySettings.cmake)       



############################ Include Configurations ########################
### Include the config file
if(EXISTS ${SOURCE_FOLDER_DIR})
    include(${SOURCE_FOLDER_DIR}/01-Dep/Config.cmake)       
else()
    message(FATAL_ERROR "Invalid 'Config.cmake' directory")      
endif()


############################ Include default config file ########################
### Include the config file
include(${TOOLS_FOLDER_DIR}/Default_Config.cmake)       




############################ Include all supported files ########################
### Include the config file
include(${TOOLS_FOLDER_DIR}/FileScan.cmake)   





############################ Generate directories ########################
### Include the config file
include(${TOOLS_FOLDER_DIR}/StatusGenerator.cmake)   





############################ Compiler Settings ########################
### Include the config file
include(${TOOLS_FOLDER_DIR}/CompilerSettings.cmake)   







############################ Generate Hex Files ########################
### Add Executable
message(" -->> Cofigure the executable files ....")
message(" ")

if (ALL_SOURCE_FILES)
    add_executable(${PROJECT_NAME} ${ALL_SOURCE_FILES})
else()
    ### Do not generate output
    message(WARNING" !!! No source files to build !!! ")
endif()


### include directories
target_include_directories(${PROJECT_NAME} PUBLIC ${ALL_INCLUDE_DIRS} PRIVATE ${COMPILER_INCLUDES})

