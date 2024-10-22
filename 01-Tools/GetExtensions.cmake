#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    GetExtensions.cmake                     #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    Get supported Extensions                #######
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


### Set extentions
if (PROJECT_LANGUAGE STREQUAL "CXX")
    set(PROJECT_SOURCE_FILE_EXTENSIONS         c cpp asm s)
    set(PROJECT_INCLUDE_FILES_EXTENSIONS       h hpp)
elseif (PROJECT_LANGUAGE STREQUAL "C")
    set(PROJECT_SOURCE_FILE_EXTENSIONS         c asm s)
    set(PROJECT_INCLUDE_FILES_EXTENSIONS       h)
else()
    message(FATAL_ERROR " xxx  ${PROJECT_LANGUAGE} is not supported  xxx  ")
endif()


set(PROJECT_ALL_FILES_EXTENSIONS ${PROJECT_SOURCE_FILE_EXTENSIONS} ${PROJECT_INCLUDE_FILES_EXTENSIONS})




############################ Message Extensions ########################
message(" -->> Scanned Extensions ${PROJECT_SOURCE_FILE_EXTENSIONS} ${PROJECT_INCLUDE_FILES_EXTENSIONS}")