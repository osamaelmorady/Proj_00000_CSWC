#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    DirectorySettings.cmake                 #######
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








	



# ##################################################################################################################################################################
# ##################################################################################################################################################################
# ##################################################################################################################################################################
# ##### toolchain Selection
# if(${COMPILER_TYPE} STREQUAL "WINDOWS")
# elseif(${COMPILER_TYPE} STREQUAL "GENERIC")
# elseif(${COMPILER_TYPE} STREQUAL "GCC-AVR")
# elseif(${COMPILER_TYPE} STREQUAL "GCC-ARM")
# elseif(${COMPILER_TYPE} STREQUAL "GCC-RL78")
# else()
#     message(FATAL_ERROR "COMPILER_TYPE : ${COMPILER_TYPE} is Not Supported.")
# endif()



# ##### toolchain set
# if(${ARCHITECTURE} STREQUAL "WINDOWS")
#     ### Load the default compiler paths
# elseif(${ARCHITECTURE} STREQUAL "GENERIC")
#     set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/gcc.exe)
#     set(CMAKE_CXX_COMPILER                ${COMPILER_PATH}/bin/g++.exe)
#     set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/as.exe)
#     set(CMAKE_OBJCOPY              ${COMPILER_PATH}/bin/objcopy.exe)
#     set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/ld.exe)
#     # set(CMAKE_ELF_TOOL                        "${COMPILER_PATH}/bin/ielftool.exe")
# elseif(${ARCHITECTURE} STREQUAL "AVR")
#     set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/avr-gcc.exe)
#     set(CMAKE_CXX_COMPILER                ${COMPILER_PATH}/bin/avr-cpp.exe)
#     set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/avr-as.exe)
#     set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/avr-ld.exe)
#     # set(CMAKE_ELF_TOOL                        "${COMPILER_PATH}/bin/ielftool.exe")
# elseif(${ARCHITECTURE} STREQUAL "RL78")
#     set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/rl78-elf-gcc.exe)
#     set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/rl78-elf-cpp.exe)
#     set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/rl78-elf-as.exe)
#     set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/rl78-elf-ld.exe)
#     # set(CMAKE_ELF_TOOL                        "${COMPILER_PATH}/bin/rl78-elf-elfedit.exe")
# elseif(${ARCHITECTURE} STREQUAL "ARM")
#     set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/arm-none-eabi-gcc.exe)
#     set(CMAKE_CXX_COMPILER                ${COMPILER_PATH}/bin/arm-none-eabi-c++.exe)
#     set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/arm-none-eabi-as.exe)
#     set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/arm-none-eabi-ld.exe)
#     # set(CMAKE_ELF_TOOL                        "${COMPILER_PATH}/bin/ielftool.exe")
# else()
#     message(FATAL_ERROR "ARCHITECTURE : Not Supported")
# endif()



# ##### Flags set
# if(${COMPILER_TYPE} STREQUAL "WINDOWS")
#     set(DEFAULT_C_FLAGS  -g -c -o -Wall )
#     set(DEFAULT_CXX_FLAGS  -g -o -Wall )
#     set(DEFAULT_ASM_FLAGS -S)
#     set(DEFAULT_LINK_FLAGS_DEBUG )
#     set(DEFAULT_LINK_FLAGS_RELEASE )
#     set(LINKER_FILE_CFG_PAR )
# elseif(${COMPILER_TYPE} STREQUAL "GENERIC")
#     set(DEFAULT_C_FLAGS  -g -c -o -Wall -I. -I${ALL_SOURCE_FILES})
#     set(DEFAULT_CXX_FLAGS  -g -o -Wall -I. -I${ALL_SOURCE_FILES})
#     set(DEFAULT_ASM_FLAGS -S)
#     set(DEFAULT_LINK_FLAGS_DEBUG -Wl,–verbose -Wl,–print-memory-usage -Wl,-s -Wl,–subsystem,console -nostartfiles -nostdlib -nodefaultlibs -Wl,-Map=${PROJECT_NAME}.map -Wl,T${LINKER_FOLDER_DIR}/${LINKER_FILE})
#     set(DEFAULT_LINK_FLAGS_RELEASE )
#     set(LINKER_FILE_CFG_PAR )
# elseif(${COMPILER_TYPE} STREQUAL "GCC-AVR")
#     set(DEFAULT_C_FLAGS -E -C -G --silent)
#     set(DEFAULT_ASM_FLAGS -C -G )
#     set(DEFAULT_LINK_FLAGS_DEBUG -C -G -f --map ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
#     set(DEFAULT_LINK_FLAGS_RELEASE -C -G -f --map ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
#     set(LINKER_FILE_CFG_PAR --config)
# elseif(${COMPILER_TYPE} STREQUAL "GCC-RL78")
#     set(DEFAULT_C_FLAGS -E -C -G --silent)
#     set(DEFAULT_ASM_FLAGS -C -G )
#     set(DEFAULT_LINK_FLAGS_DEBUG -C -G -f --map ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
#     set(DEFAULT_LINK_FLAGS_RELEASE -C -G -f --map ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
#     set(    LINKER_FILE_CFG_PAR --config)
# elseif(${COMPILER_TYPE} STREQUAL "GCC-ARM")
#     set(DEFAULT_C_FLAGS -std=gnu99 -g -o -Wall )
#     set(DEFAULT_ASM_FLAGS -S)
#     set(DEFAULT_LINK_FLAGS_DEBUG -f -g -Wl,--whole-archive  -Wl,--no-whole-archive -o)
#     set(DEFAULT_LINK_FLAGS_RELEASE -f -g -Wl,--whole-archive  -Wl,--no-whole-archive -o)
# set(LINKER_FILE_CFG_PAR )
# elseif(${COMPILER_TYPE} STREQUAL "IAR")
#     message(FATAL_ERROR "COMPILER_TYPE : Not Supported")
# else()
#     message(FATAL_ERROR "COMPILER_TYPE : Not Supported")
# endif()



# ##### Output set
# set(DEFAULT_EXECUTABLE_SUFFIX        "exe")
# set(DEFAULT_OUT_SUFFIX        "out")
# set(DEFAULT_HEX_SUFFUX        "hex")
# set(DEFAULT_ELF_SUFFUX        "elf")


	

# ##################################################################################################################################################################
# ##################################################################################################################################################################
# ##################################################################################################################################################################


# # ############################# build.txt with Scan Flags ########################
# ### Generate build.txt with C_Flags
# if(PROJECT_LANGUAGE STREQUAL "C")
	
# 	SET(CONTENTS "")
# 	SET(COMPILED_SOURCES ${ALL_SOURCE_FILES})
# 	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.h$")
# 	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.asm$")
	
# 	SET(CONTENTS "${CONTENTS}dir::${SOURCE_FOLDER_DIR}\n")
# 	SET(FLAGS_C_SPACED "")
# 	FOREACH(flag ${CUSTOM_C_FLAGS})
# 		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
# 	ENDFOREACH(flag)
# 	FOREACH(flag ${DEFAULT_C_FLAGS})
# 		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
# 	ENDFOREACH(flag)

# 	# Remove string "SHELL:" from flags before writing into build_db
# 	String(REPLACE "SHELL:" "" FLAGS_C_SPACED ${FLAGS_C_SPACED}) 
	
# 	SET(INC_DIRS "")
# 	FOREACH(inc_dir ${ALL_INCLUDE_DIRS})
# 		SET(INC_DIRS "${INC_DIRS} -I\"${inc_dir}\"")
# 	ENDFOREACH(inc_dir)
# 	FOREACH(inc_dir ${compiler_include_directories})
# 		SET(INC_DIRS "${INC_DIRS} -I${inc_dir}")
# 	ENDFOREACH(inc_dir)

#     ### Generate build.txt with C_Flags
# 	FOREACH(line ${COMPILED_SOURCES})
# 		string(REPLACE ":" "_" OBJ_DIR ${line})
# 		SET(OBJ_FILE "${CMAKE_OBJECTS_OUTPUT_DIRECTORY}/${OBJ_DIR}.obj")
# 		if(${COMPILER_TYPE} STREQUAL "WINDOWS")
# 			SET(CONTENTS "${CONTENTS}cmd::gcc ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")
# 		else()
# 			SET(CONTENTS "${CONTENTS}cmd::gcc ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")  
# 		endif()
# 	ENDFOREACH(line)
	
# 	file(WRITE ${EXECUTABLES_FOLDER_DIR}/build_db.txt ${CONTENTS})

# ### Generate build.txt with C++_Flags
# elseif(PROJECT_LANGUAGE STREQUAL "CXX")
	
# 	SET(CONTENTS "")
# 	SET(COMPILED_SOURCES ${ALL_SOURCE_FILES})
# 	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.h$")
#     list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.hpp$")
# 	list(FILTER COMPILED_SOURCES EXCLUDE REGEX "\\.asm$")
	
# 	SET(CONTENTS "${CONTENTS}dir::${SOURCE_FOLDER_DIR}\n")
# 	SET(FLAGS_C_SPACED "")
# 	FOREACH(flag ${CUSTOM_C_FLAGS})
# 		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
# 	ENDFOREACH(flag)
# 	FOREACH(flag ${DEFAULT_C_FLAGS})
# 		SET(FLAGS_C_SPACED "${FLAGS_C_SPACED} ${flag}")
# 	ENDFOREACH(flag)

# 	# Remove string "SHELL:" from flags before writing into build_db
# 	String(REPLACE "SHELL:" "" FLAGS_C_SPACED ${FLAGS_C_SPACED}) 
	
# 	SET(INC_DIRS "")
# 	FOREACH(inc_dir ${ALL_INCLUDE_DIRS})
# 		SET(INC_DIRS "${INC_DIRS} -I\"${inc_dir}\"")
# 	ENDFOREACH(inc_dir)
# 	FOREACH(inc_dir ${compiler_include_directories})
# 		SET(INC_DIRS "${INC_DIRS} -I${inc_dir}")
# 	ENDFOREACH(inc_dir)

#     ### Generate build.txt with C++_Flags
# 	FOREACH(line ${COMPILED_SOURCES})
# 		string(REPLACE ":" "_" OBJ_DIR ${line})
# 		SET(OBJ_FILE "${CMAKE_OBJECTS_OUTPUT_DIRECTORY}/${OBJ_DIR}.obj")
# 		if(${COMPILER_TYPE} STREQUAL "WINDOWS")
# 			SET(CONTENTS "${CONTENTS}cmd::g++ ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")
# 		else()
# 			SET(CONTENTS "${CONTENTS}cmd::gcc++ ${FLAGS_C_SPACED} ${INC_DIRS} -o${OBJ_FILE} ${line}\n")  
# 		endif()
# 	ENDFOREACH(line)
	
# 	file(WRITE ${EXECUTABLES_FOLDER_DIR}/build_db.txt ${CONTENTS})
	
# endif()







# ############################# Set Microcontroller ########################
# set(CMAKE_SYSTEM_PROCESSOR          ${MICROCONTROLLER})


# ############################# Set Architecture ########################
# if(${ARCHITECTURE} STREQUAL "WINDOWS" AND ALL_SOURCE_FILES)

#         ### include directories
#         target_include_directories(${PROJECT_NAME} PUBLIC ${ALL_INCLUDE_DIRS} PRIVATE ${COMPILER_INCLUDES})

#         ### compile
#         if (PROJECT_LANGUAGE STREQUAL "C")
#             target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${DEFAULT_C_FLAGS}>
#             $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${DEFAULT_ASM_FLAGS}>  )
#         elseif (PROJECT_LANGUAGE STREQUAL "CXX")
#             target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_CXX_FLAGS} ${DEFAULT_CXX_FLAGS}>
#             $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${DEFAULT_ASM_FLAGS}>  )
#         else()
#             message(FATAL_ERROR " xxx  ${PROJECT_LANGUAGE} is not supported  xxx  ")
#         endif()

#         ### link
#         if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#             set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#         elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#             set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#         endif()
#         target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${DEFAULT_LINK_FLAGS} ${CUSTOM_LINKER_FLAGS} ${LINKER_FILE_CFG_PAR} -T ${LINKER_FOLDER_DIR}/${LINKER_FILE})

# elseif(${ARCHITECTURE} STREQUAL "GENERIC")

#     set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".${DEFAULT_HEX_SUFFUX}")
    
#     # target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${DEFAULT_C_FLAGS}>
#     # $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${DEFAULT_ASM_FLAGS}>
#     # )
    
#     set (OBJCPY ${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})
#     set(POST_BUILD_COMMAND ${OBJCPY} -O ihex  ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX} -O binary  ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.bin)


#     # set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#     set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS>  -o <OBJECT> -c <SOURCE>")
#     set(OBJECTS ${OBJECTS})
#     if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#         set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#     elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#         set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#     endif()
#     target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${DEFAULT_LINK_FLAGS} ${CUSTOM_LINK_FLAGS} ${LINKER_FILE_CFG_PAR} ${LINKER_FOLDER_DIR}/${LNKFILENAME}) 
# elseif(${ARCHITECTURE} STREQUAL "ARM")

#     set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".${DEFAULT_HEX_SUFFUX}" SUFFIX ".${DEFAULT_OUT_SUFFIX}")

#     # target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${DEFAULT_C_FLAGS}>
#     # $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${DEFAULT_ASM_FLAGS}>
#     # )

#     set (OBJCPY ${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX} ${PROJECT_NAME}.${DEFAULT_OUT_SUFFIX})
#     set(POST_BUILD_COMMAND ${${ELF_TOOL}} -O --verbose ihex  ${EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})

#     # set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#     set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS>  -o <OBJECT> -c <SOURCE>")
#     set(OBJECTS ${OBJECTS})
#     if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#         set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#     elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#         set(DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#     endif()
#     target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${DEFAULT_LINK_FLAGS} ${CUSTOM_LINK_FLAGS} ${LINKER_FILE_CFG_PAR} ${LINKER_FOLDER_DIR}/${LNKFILENAME}) 
# else()
#     message(FATAL_ERROR "")    
# endif()

