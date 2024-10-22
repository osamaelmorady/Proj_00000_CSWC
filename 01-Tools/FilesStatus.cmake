#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    StatusGenerator.cmake                   #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    generate build status files             #######
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



### Generate directories
if(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_SOURCE_DIR})
	SET(COMPILED_SOURCES ${PROJECT_ALL_SOURCE_FILES})
    SET(COMPILED_HEADERS ${PROJECT_ALL_HEADER_FILES})

	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.asm$")

    ### Generate Headers.txt
    SET(CONTENTS "")
    FOREACH(line ${COMPILED_HEADERS})
        SET(CONTENTS "${CONTENTS}${line}\n")
    ENDFOREACH(line)    
    file(WRITE ${PROJECT_EXECUTABLES_FOLDER_DIR}/Headers.txt ${CONTENTS})
    message(" -->> Generate Headers.txt ...... ")

    ### Generate SourceFiles.txt
    SET(CONTENTS "")
    FOREACH(line ${COMPILED_SOURCES})
        SET(CONTENTS "${CONTENTS}${line}\n")
    ENDFOREACH(line)    
    file(WRITE ${PROJECT_EXECUTABLES_FOLDER_DIR}/SourceFiles.txt ${CONTENTS})
    message(" -->> Generate SourceFiles.txt ...... ")
    
    ### Generate Directories.txt
    SET(CONTENTS "")
    FOREACH(line ${PROJECT_ALL_INCLUDE_DIRS})
        SET(CONTENTS "${CONTENTS}${line}\n")
    ENDFOREACH(line)    
    file(WRITE ${PROJECT_EXECUTABLES_FOLDER_DIR}/Directories.txt ${CONTENTS})
    message(" -->> Generate Directories.txt ...... ")
endif()