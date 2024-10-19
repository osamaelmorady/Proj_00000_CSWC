#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    DirSettings.cmake                       #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    generate default build directories      #######
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
set(TOOLS_FOLDER_DIR ${PROJECT_FOLDER_DIR}/01-Tools)
set(SOURCE_FOLDER_DIR ${PROJECT_FOLDER_DIR}/02-Source)
set(LINKER_FOLDER_DIR ${PROJECT_FOLDER_DIR}/02-Source/01-Dep)
set(TEST_FOLDER_DIR ${PROJECT_FOLDER_DIR}/03-Tests)
set(EXECUTABLES_FOLDER_DIR ${PROJECT_FOLDER_DIR}/05-Build)



set(CMAKE_CURRENT_BINARY_DIR ${PROJECT_FOLDER_DIR}/CMake)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
set_source_files_properties(SOURCE CMakeLists.txt DIR1 ${PROJECT_FOLDER_DIR})



set(CMAKE_VS_SDK_SOURCE_DIRECTORIES ${PROJECT_FOLDER_DIR})
set(CMAKE_DEP_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/01-dep)
set(CMAKE_LST_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/02-Lst)
set(CMAKE_OBJECTS_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/03-Obj)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/04-Exe)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/04-Exe)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLES_FOLDER_DIR}/04-Exe)

### create lst, dep, obj, exe directories
file(MAKE_DIRECTORY ${CMAKE_DEP_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_OBJECTS_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_LST_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})