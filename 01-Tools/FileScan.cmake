#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    FileScan.cmake                          #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    Scan all files and directories          #######
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
    set(SOURCE_FILE_EXTENSIONS         c cpp asm s)
    set(INCLUDE_FILES_EXTENSIONS       h hpp)
elseif (PROJECT_LANGUAGE STREQUAL "C")
    set(SOURCE_FILE_EXTENSIONS         c asm s)
    set(INCLUDE_FILES_EXTENSIONS       h)
else()
    message(FATAL_ERROR " xxx  ${PROJECT_LANGUAGE} is not supported  xxx  ")
endif()





############################ SCAN Files ########################
message(" -->> Scan all files and directories .... ")


set(ALL_FILES_EXTENSIONS ${SOURCE_FILE_EXTENSIONS} ${INCLUDE_FILES_EXTENSIONS})

set(ALL_SOURCE_FILES    "")
set(ALL_HEADER_FILES    "")
set(ALL_INCLUDE_DIRS    "")
set(CHILD_FILES         "")



function(SCAN_SWC CURR_DIR)
    set(MY_SOURCE_FILES         "")
    set(CHILD_FILES             "")

    ### Get All files including paths
    foreach(EXTENSION ${ALL_FILES_EXTENSIONS})
        file(GLOB_RECURSE FILES_RECURSE LIST_DIRECTORIES true ${CURR_DIR}/*.${EXTENSION})
        list(APPEND MY_SOURCE_FILES ${FILES_RECURSE})
    endforeach()
    ### Remove duplicated
    list(REMOVE_DUPLICATES MY_SOURCE_FILES)
    ### Add current search directory
    list(APPEND MY_SOURCE_FILES ${CURR_DIR})
    ### Remove include files (leaving only source files)
    foreach(EXTENSION ${INCLUDE_FILES_EXTENSIONS})
        list(FILTER MY_SOURCE_FILES EXCLUDE REGEX "/.${EXTENSION}$")
    endforeach()

    set(CHILD_FILES ${MY_SOURCE_FILES} PARENT_SCOPE)

endfunction()



### Classify sources and directories
SCAN_SWC(${SOURCE_FOLDER_DIR})

### Classify sources and directories
foreach(FILE    ${CHILD_FILES})
    if(IS_DIRECTORY ${FILE})
        list(APPEND ALL_INCLUDE_DIRS ${FILE})
        # message(STATUS "Found directory: ${FILE}")
    else()
        list(APPEND ALL_SOURCE_FILES ${FILE})
        list(APPEND ALL_HEADER_FILES ${FILE})
        # message(STATUS "Found source file: ${FILE}")
    endif()
endforeach()





############################ Sort Files ########################
message(" -->> Remove unnecessary files and directories .... ")

### filter out header files and plain directories
set(file_extensions "")
foreach(EXTENSION ${ALL_FILES_EXTENSIONS})
    set(file_extensions "${file_extensions}|\\.${EXTENSION}$")
endforeach()
STRING(SUBSTRING  ${file_extensions} 1 -1 file_extensions)
# message("file_extensions: ${file_extensions}")

list(FILTER ALL_HEADER_FILES EXCLUDE REGEX "\\.asm$")
list(FILTER ALL_HEADER_FILES EXCLUDE REGEX "\\.c$")
list(FILTER ALL_HEADER_FILES EXCLUDE REGEX "\\.cpp$")
foreach(FILE ${ALL_HEADER_FILES})
    # message("SEARCHING FOR: ${FILE}")
    if(NOT ${FILE} MATCHES "${file_extensions}")
        list(REMOVE_ITEM ALL_HEADER_FILES ${FILE} )
    endif()
endforeach()


list(FILTER ALL_SOURCE_FILES EXCLUDE REGEX "\\.h$")
list(FILTER ALL_SOURCE_FILES EXCLUDE REGEX "\\.hpp$")
foreach(FILE ${ALL_SOURCE_FILES})
    # message("SEARCHING FOR: ${FILE}")
    if(NOT ${FILE} MATCHES "${file_extensions}")
        list(REMOVE_ITEM ALL_SOURCE_FILES ${FILE} )
    endif()
endforeach()





############################ Include Std library Files ########################
message(" -->> Add Compiler std libraries and includes ....")
set(COMPILER_INCLUDES "")


# ### Add Target Std libraries
# if (EXISTS ${COMPILER_PATH}/include AND EXISTS ${COMPILER_PATH}/lib)
#     set(COMPILER_INCLUDES ${COMPILER_PATH}'/include/** ${COMPILER_PATH}/lib/**)
# elseif(EXISTS ${COMPILER_PATH}/inc AND EXISTS ${COMPILER_PATH}/lib)
#     set(COMPILER_INCLUDES ${COMPILER_PATH}/inc/** ${COMPILER_PATH}/lib/**)
# else()
#     message(FATAL_ERROR " !!! COMPILER_PATH  path has no include dir or lib dir  !!!") 
# endif()



############################ Exclude  Directories & Files ########################
message(" -->> Remove excluded files and directories ....")

#### Exclude Directories
foreach(EXCLUDE_DIR ${EXCLUDE_DIRS})
    list(FILTER ALL_SOURCE_FILES EXCLUDE REGEX "${EXCLUDE_DIR}/.*")
    list(FILTER ALL_HEADER_FILES EXCLUDE REGEX "${EXCLUDE_DIR}/.*")
    list(FILTER ALL_INCLUDE_DIRS EXCLUDE REGEX "${EXCLUDE_DIR}")
endforeach()


#### Exclude Files
foreach(EXCLUDE_FILE ${EXCLUDE_FILES})
    list(FILTER ALL_SOURCE_FILES EXCLUDE REGEX "/${EXCLUDE_FILE}$")
endforeach()

#### Sort files and include directories
list(SORT ALL_SOURCE_FILES COMPARE FILE_BASENAME)
list(SORT ALL_HEADER_FILES COMPARE FILE_BASENAME)
list(SORT ALL_INCLUDE_DIRS)