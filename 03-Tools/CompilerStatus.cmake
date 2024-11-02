#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    CompilerStatus.cmake                   #######
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


# ############################# build.txt with Scan Flags ########################
### Generate build.txt with C_Flags
if(PROJECT_LANGUAGE STREQUAL "C")
	
	SET(CONTENTS "")
	SET(COMPILED_SOURCES ${PROJECT_ALL_SOURCE_FILES})
	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.h$")
	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.asm$")
	
	SET(CONTENTS "${CONTENTS}dir::${PROJECT_SOURCE_FOLDER_DIR}\n")
	SET(FLAGS_C_SPACED "")
	FOREACH(flag ${PROJECT_CUSTOM_C_FLAGS})
		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
	ENDFOREACH(flag)
	FOREACH(flag ${PROJECT_DEFAULT_C_FLAGS})
		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
	ENDFOREACH(flag)

	# Remove string "SHELL:" from flags before writing into build_db
	String(REPLACE "SHELL:" "" FLAGS_C_SPACED ${FLAGS_C_SPACED}) 
	
	SET(INC_DIRS "")
	FOREACH(inc_dir ${PROJECT_ALL_INCLUDE_DIRS})
		SET(INC_DIRS "${INC_DIRS} -I\"${inc_dir}\"")
	ENDFOREACH(inc_dir)
	FOREACH(inc_dir ${compiler_include_directories})
		SET(INC_DIRS "${INC_DIRS} -I${inc_dir}")
	ENDFOREACH(inc_dir)

    ### Generate build.txt with C_Flags
	FOREACH(line ${COMPILED_SOURCES})
		string(REPLACE ":" "_" OBJ_DIR ${line})
		SET(OBJ_FILE "${CMAKE_OBJECTS_OUTPUT_DIRECTORY}/${OBJ_DIR}.obj")
		if(${COMPILER_TYPE} STREQUAL "WINDOWS")
			SET(CONTENTS "${CONTENTS}cmd::gcc ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")
		else()
			SET(CONTENTS "${CONTENTS}cmd::gcc ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")  
		endif()
	ENDFOREACH(line)
	
	file(WRITE ${PROJECT_EXECUTABLES_FOLDER_DIR}/build_db.txt ${CONTENTS})

### Generate build.txt with C++_Flags
elseif(PROJECT_LANGUAGE STREQUAL "CXX")
	
	SET(CONTENTS "")
	SET(COMPILED_SOURCES ${PROJECT_ALL_SOURCE_FILES})
	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.h$")
    list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.hpp$")
	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.asm$")
	
	SET(CONTENTS "${CONTENTS}dir::${PROJECT_SOURCE_FOLDER_DIR}\n")
	SET(FLAGS_CXX_SPACED "")
	FOREACH(flag ${PROJECT_CUSTOM_CXX_FLAGS})
		SET(FLAGS_CXX_SPACED "${FLAGS_CXX_SPACED} ${flag}")
	ENDFOREACH(flag)
	FOREACH(flag ${PROJECT_DEFAULT_CXX_FLAGS})
		SET(FLAGS_CXX_SPACED "${FLAGS_CXX_SPACED} ${flag}")
	ENDFOREACH(flag)

	# Remove string "SHELL:" from flags before writing into build_db
	String(REPLACE "SHELL:" "" FLAGS_CXX_SPACED ${FLAGS_CXX_SPACED}) 
	
	SET(INC_DIRS "")
	FOREACH(inc_dir ${PROJECT_ALL_INCLUDE_DIRS})
		SET(INC_DIRS "${INC_DIRS} -I\"${inc_dir}\"")
	ENDFOREACH(inc_dir)
	FOREACH(inc_dir ${compiler_include_directories})
		SET(INC_DIRS "${INC_DIRS} -I${inc_dir}")
	ENDFOREACH(inc_dir)

    ### Generate build.txt with C++_Flags
	FOREACH(line ${COMPILED_SOURCES})
		string(REPLACE ":" "_" OBJ_DIR ${line})
		SET(OBJ_FILE "${CMAKE_OBJECTS_OUTPUT_DIRECTORY}/${OBJ_DIR}.obj")
		if(${COMPILER_TYPE} STREQUAL "WINDOWS")
			SET(CONTENTS "${CONTENTS}cmd::g++ ${FLAGS_CXX_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")
		else()
			SET(CONTENTS "${CONTENTS}cmd::gcc++ ${FLAGS_CXX_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")  
		endif()
	ENDFOREACH(line)
	
	file(WRITE ${PROJECT_EXECUTABLES_FOLDER_DIR}/build_db.txt ${CONTENTS})
	
endif()