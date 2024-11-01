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


##### Output set
set(DEFAULT_EXECUTABLE_SUFFIX        "exe")
set(DEFAULT_OUT_SUFFIX        "out")
set(DEFAULT_HEX_SUFFUX        "hex")
set(DEFAULT_ELF_SUFFUX        "elf")
set(DEFAULT_LIB_SUFFUX        "a")





set(PROJECT_TARGET ${PROJECT_NAME})


set(PROJECT_TARGET_2 ${PROJECT_NAME})

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
    if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
        set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
    elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
        set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
    endif()
    target_link_options(${PROJECT_TARGET} BEFORE PUBLIC  ${PROJECT_CUSTOM_LINKER_FLAGS} ${PROJECT_DEFAULT_LINK_FLAGS} -T ${PROJECT_LINKER_FOLDER_DIR}/${PROJECT_LINKER_FILE})


    # set(POST_BUILD_COMMAND ${CMAKE_OBJCOPY} -O ihex  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_EXECUTABLE_SUFFIX} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})

    # add_custom_command(
    #     TARGET ${PROJECT_TARGET}
    #     POST_BUILD
    #     COMMAND ${POST_BUILD_COMMAND}
    #     DEPENDS $<TARGET_FILE:${PROJECT_TARGET}>
    #     COMMENT "Creating Intel HEX file from exe"
    # )

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
    if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
        set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
    elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
        set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
    endif()
    target_link_options(${PROJECT_TARGET} BEFORE PUBLIC  ${PROJECT_CUSTOM_LINKER_FLAGS} ${PROJECT_DEFAULT_LINK_FLAGS} -T ${PROJECT_LINKER_FOLDER_DIR}/${PROJECT_LINKER_FILE})


# elseif(${ARCHITECTURE} STREQUAL "ARM")

#     set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".${DEFAULT_HEX_SUFFUX}" SUFFIX ".${DEFAULT_OUT_SUFFIX}")

#     # target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${PROJECT_CUSTOM_C_FLAGS} ${PROJECT_DEFAULT_C_FLAGS}>
#     # $<$<COMPILE_LANGUAGE:ASM>:${PROJECT_CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}>
#     # )

#     set (OBJCPY ${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX} ${PROJECT_NAME}.${DEFAULT_OUT_SUFFIX})
#     set(POST_BUILD_COMMAND ${${ELF_TOOL}} -O --verbose ihex  ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})

#     # set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#     set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS>  -o <OBJECT> -c <SOURCE>")
#     set(OBJECTS ${OBJECTS})
#     if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#         set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#     elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#         set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#     endif()
#     target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${PROJECT_DEFAULT_LINK_FLAGS} ${CUSTOM_LINK_FLAGS} ${LINKER_FILE_CFG_PAR} ${PROJECT_LINKER_FOLDER_DIR}/${LNKFILENAME}) 
# else()
#     message(FATAL_ERROR "")    
endif()


