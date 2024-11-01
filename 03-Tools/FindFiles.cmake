#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    FindFiles.cmake                         #######
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
set(CHILD_FILES         "")



############################ SCAN Files ########################
message(" -->> Scan all files and directories .... ")

### Classify sources and directories
SCAN_SWC(${PROJECT_SOURCE_FOLDER_DIR})




############################ Classify sources, headers and directories ########################
### Classify sources and directories
foreach(FILE    ${CHILD_FILES})
    if(IS_DIRECTORY ${FILE})
        list(APPEND PROJECT_ALL_INCLUDE_DIRS ${FILE})
        # message(STATUS "Found directory: ${FILE}")
    else()
        list(APPEND PROJECT_ALL_SOURCE_FILES ${FILE})
        list(APPEND PROJECT_ALL_HEADER_FILES ${FILE})
        # message(STATUS "Found source file: ${FILE}")
    endif()
endforeach()







####################################### Sort Files #########################################
message(" -->> Remove unnecessary files and directories .... ")

### filter out header files and plain directories
set(file_extensions "")
foreach(EXTENSION ${PROJECT_ALL_FILES_EXTENSIONS})
    set(file_extensions "${file_extensions}|\\.${EXTENSION}$")
endforeach()
STRING(SUBSTRING  ${file_extensions} 1 -1 file_extensions)
# message("file_extensions: ${file_extensions}")

list(FILTER PROJECT_ALL_HEADER_FILES EXCLUDE REGEX "\\.asm$")
list(FILTER PROJECT_ALL_HEADER_FILES EXCLUDE REGEX "\\.c$")
list(FILTER PROJECT_ALL_HEADER_FILES EXCLUDE REGEX "\\.cpp$")
foreach(FILE ${PROJECT_ALL_HEADER_FILES})
    # message("SEARCHING FOR: ${FILE}")
    if(NOT ${FILE} MATCHES "${file_extensions}")
        list(REMOVE_ITEM PROJECT_ALL_HEADER_FILES ${FILE} )
    endif()
endforeach()


list(FILTER PROJECT_ALL_SOURCE_FILES EXCLUDE REGEX "\\.h$")
list(FILTER PROJECT_ALL_SOURCE_FILES EXCLUDE REGEX "\\.hpp$")
foreach(FILE ${PROJECT_ALL_SOURCE_FILES})
    # message("SEARCHING FOR: ${FILE}")
    if(NOT ${FILE} MATCHES "${file_extensions}")
        list(REMOVE_ITEM PROJECT_ALL_SOURCE_FILES ${FILE} )
    endif()
endforeach()





############################ Include Std library Files ########################
message(" -->> Add Compiler std libraries and includes ....")

# ### Add Target Std libraries
# if (EXISTS ${COMPILER_PATH}/include AND EXISTS ${COMPILER_PATH}/lib)
#     set(PROJECT_COMPILER_INCLUDES ${COMPILER_PATH}'/include/** ${COMPILER_PATH}/lib/**)
# elseif(EXISTS ${COMPILER_PATH}/inc AND EXISTS ${COMPILER_PATH}/lib)
#     set(PROJECT_COMPILER_INCLUDES ${COMPILER_PATH}/inc/** ${COMPILER_PATH}/lib/**)
# else()
#     message(FATAL_ERROR " !!! COMPILER_PATH  path has no include dir or lib dir  !!!") 
# endif()



############################ Exclude  Directories & Files ########################
message(" -->> Remove excluded files and directories ....")

#### Exclude Directories
foreach(EXCLUDE_DIR ${EXCLUDE_DIRS})
    list(FILTER PROJECT_ALL_SOURCE_FILES EXCLUDE REGEX "${EXCLUDE_DIR}/.*")
    list(FILTER PROJECT_ALL_HEADER_FILES EXCLUDE REGEX "${EXCLUDE_DIR}/.*")
    list(FILTER PROJECT_ALL_INCLUDE_DIRS EXCLUDE REGEX "${EXCLUDE_DIR}")
endforeach()


#### Exclude Files
foreach(EXCLUDE_FILE ${EXCLUDE_FILES})
    list(FILTER PROJECT_ALL_SOURCE_FILES EXCLUDE REGEX "/${EXCLUDE_FILE}$")
endforeach()

#### Sort files and include directories
list(SORT PROJECT_ALL_SOURCE_FILES COMPARE FILE_BASENAME)
list(SORT PROJECT_ALL_HEADER_FILES COMPARE FILE_BASENAME)
list(SORT PROJECT_ALL_INCLUDE_DIRS)