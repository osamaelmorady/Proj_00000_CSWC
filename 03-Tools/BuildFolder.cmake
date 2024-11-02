#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    BuildFolder.cmake                       #######
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

set(CMAKE_CURRENT_BINARY_DIR ${PROJECT_FOLDER_DIR}/CMake)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
set_source_files_properties(SOURCE CMakeLists.txt DIR1 ${PROJECT_FOLDER_DIR})




set(CMAKE_VS_SDK_SOURCE_DIRECTORIES ${PROJECT_FOLDER_DIR})
set(CMAKE_LST_OUTPUT_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/01-Lst)
set(CMAKE_OBJECTS_OUTPUT_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/02-Obj)
set(CMAKE_CURRENT_BINARY_DIR  ${PROJECT_EXECUTABLES_FOLDER_DIR}/02-Obj)
set(CMAKE_STATIC_LIBRARY_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/04-lib)
set(CMAKE_SHARED_LIBRARY_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/04-lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/04-lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/04-lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR}/03-Exe)



set(CMAKE_MAP_FILE_DIRECTORY ${PROJECT_EXECUTABLES_FOLDER_DIR})


### create lst, obj, exe , static libraries directories
file(MAKE_DIRECTORY ${CMAKE_OBJECTS_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_LST_OUTPUT_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_STATIC_LIBRARY_DIRECTORY})
file(MAKE_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})



############################ Message Directory ########################
message(" -->>  Create Build Directory")    