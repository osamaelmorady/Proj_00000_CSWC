#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    GetFunctions.cmake                      #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    Functions support                       #######
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
set(CHILD_FILES         "")



############################ SCAN Files ########################
function(SCAN_SWC CURR_DIR)
    set(MY_SOURCE_FILES         "")
    set(CHILD_FILES             "")

    ### Get All files including paths
    foreach(EXTENSION ${PROJECT_ALL_FILES_EXTENSIONS})
        file(GLOB_RECURSE FILES_RECURSE LIST_DIRECTORIES true ${CURR_DIR}/*.${EXTENSION})
        list(APPEND MY_SOURCE_FILES ${FILES_RECURSE})
    endforeach()
    ### Remove duplicated
    list(REMOVE_DUPLICATES MY_SOURCE_FILES)
    ### Add current search directory
    list(APPEND MY_SOURCE_FILES ${CURR_DIR})
    ### Remove include files (leaving only source files)
    foreach(EXTENSION ${PROJECT_INCLUDE_FILES_EXTENSIONS})
        list(FILTER MY_SOURCE_FILES EXCLUDE REGEX "/.${EXTENSION}$")
    endforeach()

    ### Set PARENT_SCOPE of CHILD_FILES
    set(CHILD_FILES ${MY_SOURCE_FILES} PARENT_SCOPE)

endfunction()



