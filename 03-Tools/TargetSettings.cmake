#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    TargetSettings.cmake                    #######
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
set(PROJECT_TARGET ${PROJECT_NAME})



##### Output set
set(DEFAULT_EXECUTABLE_SUFFIX        "exe")
set(DEFAULT_OUT_SUFFIX        "out")
set(DEFAULT_HEX_SUFFUX        "hex")
set(DEFAULT_ELF_SUFFUX        "elf")
set(DEFAULT_LIB_SUFFUX        "a")
set(DEFAULT_OBJECT_SUFFUX        "o")







############################ Generate Hex Files ########################
### Add Executable
message(" -->> Cofigure the executable files ....")
message(" ")



if (PROJECT_ALL_SOURCE_FILES)
    add_executable(${PROJECT_TARGET} ${PROJECT_ALL_SOURCE_FILES})
else()
    ### Do not generate output
    message(WARNING" !!! No source files to build !!! ")
endif()


# ##################################################################################################################################################################
# ##################################################################################################################################################################
# ##################################################################################################################################################################


# ############################# Set Architecture ########################
if(${ARCHITECTURE} STREQUAL "WINDOWS" AND PROJECT_ALL_SOURCE_FILES)

    ### include directories
    target_include_directories(${PROJECT_TARGET} PUBLIC ${PROJECT_ALL_INCLUDE_DIRS} PRIVATE ${PROJECT_COMPILER_INCLUDES})


    ### compile
    target_compile_options(${PROJECT_TARGET} PRIVATE 
         $<$<COMPILE_LANGUAGE:${PROJECT_LANGUAGE}>:${CUSTOM_${PROJECT_LANGUAGE}_FLAGS}
         ${PROJECT_DEFAULT_${PROJECT_LANGUAGE}_FLAGS}>
         $<$<COMPILE_LANGUAGE:ASM>:${PROJECT_CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}> 
         )

    ### link
    # <CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--out-implib,<TARGET_IMPLIB> -Wl,--major-image-version,<TARGET_VERSION_MAJOR>,--minor-image-version,<TARGET_VERSION_MINOR> <LINK_LIBRARIES>
    # set(CMAKE_${PROJECT_LANGUAGE}_LINK_EXECUTABLE  
    # <CMAKE_${PROJECT_LANGUAGE}_COMPILER>  <${PROJECT_DEFAULT_${PROJECT_LANGUAGE}_FLAGS}> <${PROJECT_CUSTOM_${PROJECT_LANGUAGE}_FLAGS}>
    # <CMAKE_LINKER>  <CMAKE_${PROJECT_LANGUAGE}_LINK_FLAGS> 
    # <OBJECTS> -o <TARGET> 
    # # -Wl,--out-implib,<TARGET_IMPLIB> -Wl,--major-image-version,<TARGET_VERSION_MAJOR>,--minor-image-version,<TARGET_VERSION_MINOR> 
    # <LINK_LIBRARIES>
    # )

    # <CMAKE_CXX_COMPILER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--out-implib,<TARGET_IMPLIB> -Wl,--major-image-version,<TARGET_VERSION_MAJOR>,--minor-image-version,<TARGET_VERSION_MINOR> <LINK_LIBRARIES>
    set_target_properties(${PROJECT_TARGET} PROPERTIES  LINK_FLAGS ${PROJECT_DEFAULT_LINK_FLAGS} )

    target_link_options(${PROJECT_TARGET} BEFORE PUBLIC  ${PROJECT_CUSTOM_LINKER_FLAGS} ${PROJECT_DEFAULT_LINK_FLAGS} -T ${PROJECT_LINKER_FOLDER_DIR}/${PROJECT_LINKER_FILE})

    # set(GENERATE_OBJECTS_COMMAND ${CMAKE_OBJCOPY} -O  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    set(GENERATE_ARCHIVE_COMMAND ${CMAKE_AR} rcs ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_LIB_SUFFUX}  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    # set(GENERATE_HEX_COMMAND ${CMAKE_OBJCOPY} -O ihex   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})
    # set(GENERATE_OUT_COMMAND ${CMAKE_OBJCOPY} -O ihex  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_OUT_SUFFUX})
    set(PRINT_SIZE_COMMAND ${CMAKE_SIZE} --format=berkeley  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})


elseif(${ARCHITECTURE} STREQUAL "AVR")

    ### include directories
    target_include_directories(${PROJECT_TARGET} PUBLIC ${PROJECT_ALL_INCLUDE_DIRS} PRIVATE ${PROJECT_COMPILER_INCLUDES})

    ### compile
    target_compile_options(${PROJECT_TARGET} PRIVATE 
         $<$<COMPILE_LANGUAGE:${PROJECT_LANGUAGE}>:${CUSTOM_${PROJECT_LANGUAGE}_FLAGS}
         ${PROJECT_DEFAULT_${PROJECT_LANGUAGE}_FLAGS}>
         $<$<COMPILE_LANGUAGE:ASM>:${PROJECT_CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}> 
         )

    ### link
    set(CMAKE_C_LINK_EXECUTABLE <CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--out-implib,<TARGET_IMPLIB> -Wl,--major-image-version,<TARGET_VERSION_MAJOR>,--minor-image-version,<TARGET_VERSION_MINOR> <LINK_LIBRARIES>)
    set(CMAKE_CXX_LINK_EXECUTABLE <CMAKE_CXX_COMPILER> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--out-implib,<TARGET_IMPLIB> -Wl,--major-image-version,<TARGET_VERSION_MAJOR>,--minor-image-version,<TARGET_VERSION_MINOR> <LINK_LIBRARIES>)
    
    target_link_options(${PROJECT_TARGET} BEFORE PUBLIC  ${PROJECT_CUSTOM_LINKER_FLAGS} ${PROJECT_DEFAULT_LINK_FLAGS} -T ${PROJECT_LINKER_FOLDER_DIR}/${PROJECT_LINKER_FILE})

    ### Additionanl post build commands
    set(PRINT_SIZE_COMMAND ${CMAKE_SIZE} --format=avr --mcu=${MICROCONTROLLER}  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    # set(GENERATE_OBJECTS_COMMAND ${CMAKE_OBJCOPY} -O  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    set(GENERATE_ARCHIVE_COMMAND ${CMAKE_AR} --format=avr --mcu=${MICROCONTROLLER}  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    # set(GENERATE_HEX_COMMAND ${CMAKE_OBJCOPY} -O ihex   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})
    # set(GENERATE_OUT_COMMAND ${CMAKE_OBJCOPY} -O ihex  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_OUT_SUFFUX})


elseif(${ARCHITECTURE} STREQUAL "ARM")

    ### include directories
    target_include_directories(${PROJECT_TARGET} PUBLIC ${PROJECT_ALL_INCLUDE_DIRS} PRIVATE ${PROJECT_COMPILER_INCLUDES})

    ### compile
    target_compile_options(${PROJECT_TARGET} PRIVATE 
         $<$<COMPILE_LANGUAGE:${PROJECT_LANGUAGE}>:${CUSTOM_${PROJECT_LANGUAGE}_FLAGS}
         ${PROJECT_DEFAULT_${PROJECT_LANGUAGE}_FLAGS}>
         $<$<COMPILE_LANGUAGE:ASM>:${PROJECT_CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}> 
         )

    ### link
    target_link_options(${PROJECT_TARGET} BEFORE PUBLIC  ${PROJECT_CUSTOM_LINKER_FLAGS} ${PROJECT_DEFAULT_LINK_FLAGS} -T ${PROJECT_LINKER_FOLDER_DIR}/${PROJECT_LINKER_FILE})

    ### Additionanl post build commands
    set(PRINT_SIZE_COMMAND ${CMAKE_SIZE} --format=avr --mcu=${MICROCONTROLLER}  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    # set(GENERATE_OBJECTS_COMMAND ${CMAKE_OBJCOPY} -O  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    set(GENERATE_ARCHIVE_COMMAND ${CMAKE_AR} --format=avr --mcu=${MICROCONTROLLER}  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX})
    # set(GENERATE_HEX_COMMAND ${CMAKE_OBJCOPY} -O ihex   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})
    # set(GENERATE_OUT_COMMAND ${CMAKE_OBJCOPY} -O ihex  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_OUT_SUFFUX})


else()
    message(FATAL_ERROR "")    
endif()








############################ Generate static libraries ########################
########### Invoke : Generate static libraries command
add_custom_command(
    TARGET ${PROJECT_TARGET}
    POST_BUILD
    COMMAND echo  --  Generate Static Library ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_LIB_SUFFUX}
    COMMAND ${GENERATE_ARCHIVE_COMMAND}
    DEPENDS $<TARGET_FILE:${PROJECT_TARGET}>
    COMMENT "Creating static library"
)




# ############################ Generate Executables outputs ########################
# ########### Invoke : Generate executables command
# add_custom_command(
#     TARGET ${PROJECT_TARGET}
#     POST_BUILD
#     COMMAND echo  --  Generate Intel Hex file ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX}
#     COMMAND ${GENERATE_HEX_COMMAND}
#     DEPENDS $<TARGET_FILE:${PROJECT_TARGET}>
#     COMMENT "Creating Hex File"
# )






############################ Generate Hex Files ########################
########### Invoke : Print Memory Usage
add_custom_command(
    TARGET ${PROJECT_TARGET}
    POST_BUILD
    COMMAND echo ----- ---- ----  ---- ---- ---- ---- ---- ------
    COMMAND echo ----- ---- ----   Memory Usage  ----  ---- -----
    COMMAND echo ----- ---- ----  ---- ---- ---- ---- ---- ------
    COMMAND ${PRINT_SIZE_COMMAND}
    COMMAND echo ----- ---- ---- ---- ---- ---- ---- ---- ------
    DEPENDS $<TARGET_FILE:${PROJECT_TARGET}>
    COMMENT "Command to print the memory usage"
)






