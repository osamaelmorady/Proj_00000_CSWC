#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    CompilerSettings.cmake                  #######
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
##### toolchain Selection
if(${COMPILER_TYPE} STREQUAL "WINDOWS")
elseif(${COMPILER_TYPE} STREQUAL "GENERIC")
elseif(${COMPILER_TYPE} STREQUAL "GCC-AVR")
elseif(${COMPILER_TYPE} STREQUAL "GCC-ARM")
elseif(${COMPILER_TYPE} STREQUAL "GCC-RL78")
else()
    message(FATAL_ERROR "COMPILER_TYPE : ${COMPILER_TYPE} is Not Supported.")
endif()




################################### Compiler paths  ########################################

##### toolchain set
if(${ARCHITECTURE} STREQUAL "WINDOWS")
    ### Load the default compiler paths
    set(CMAKE_AR                        ${COMPILER_PATH}/bin/ar.exe)
    set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/gcc.exe)
    set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/g++.exe)
    set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/gcc.exe)

    set(CMAKE_RANLIB                    ${COMPILER_PATH}/bin/ranlib)
    set(CMAKE_OBJCOPY                   ${COMPILER_PATH}/bin/dlltool.exe)
    set(CMAKE_OBJDUMP                   ${COMPILER_PATH}/bin/objcopy.exe)
    set(CMAKE_SIZE                      ${COMPILER_PATH}/bin/size)
    set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/ld.exe)

    set(CMAKE_READELF                   ${COMPILER_PATH}/bin/readelf.exe)
    set(CMAKE_GDB                      ${COMPILER_PATH}/bin/gdb.exe)
    set(CMAKE_INSTALL_PREFIX             ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    
elseif(${ARCHITECTURE} STREQUAL "AVR")
   # Set AVR toolchain variables
   set(CMAKE_AR                        ${COMPILER_PATH}/bin/avr-ar)
   set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/avr-gcc)
   set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/avr-g++)
   set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/avr-gcc)

   set(CMAKE_RANLIB                    ${COMPILER_PATH}/bin/avr-ranlib)
   set(CMAKE_OBJCOPY                   ${COMPILER_PATH}/bin/avr-objcopy)
   set(CMAKE_OBJDUMP                   ${COMPILER_PATH}/bin/avr-objdump)
   set(CMAKE_SIZE                      ${COMPILER_PATH}/bin/avr-size)
   set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/avr-ld)

   set(CMAKE_READELF                   ${COMPILER_PATH}/bin/avr-readelf)
   set(CMAKE_GDB                      ${COMPILER_PATH}/bin/avr-gdb)
   set(CMAKE_FLASH                    ${COMPILER_PATH}/bin/avrdude)
   set(CMAKE_INSTALL_PREFIX             ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
   
elseif(${ARCHITECTURE} STREQUAL "RL78")
   set(CMAKE_AR                        ${COMPILER_PATH}/bin/rl78-elf-ar)
   set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/rl78-elf-gcc)
   set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/rl78-elf-g++)
   set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/rl78-elf-gcc)

   set(CMAKE_OBJCOPY                   ${COMPILER_PATH}/bin/rl78-elf-objcopy)
   set(CMAKE_OBJDUMP                   ${COMPILER_PATH}/bin/rl78-elf-objdump)
   set(CMAKE_RANLIB                    ${COMPILER_PATH}/bin/rl78-elf-ranlib)
   set(CMAKE_SIZE                      ${COMPILER_PATH}/bin/rl78-elf-size)
   set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/rl78-elf-ld)

   set(CMAKE_ELF_TOOL                  ${COMPILER_PATH}/bin/rl78-elf-elfedit)
   set(CMAKE_GDB                      ${COMPILER_PATH}/bin/rl78-elf-gdb)
   # set(CMAKE_FLASH                    ${COMPILER_PATH}/bin/avrdude)
   set(CMAKE_INSTALL_PREFIX             ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

elseif(${ARCHITECTURE} STREQUAL "R8C")
   # Set R8C toolchain variables
   set(CMAKE_AR                        ${COMPILER_PATH}/bin/r8c-ar)
   set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/r8c-gcc)
   set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/r8c-g++)
   set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/r8c-gcc)

   set(CMAKE_OBJCOPY                   ${COMPILER_PATH}/bin/r8c-objcopy)
   set(CMAKE_OBJDUMP                   ${COMPILER_PATH}/bin/r8c-objdump)
   set(CMAKE_RANLIB                    ${COMPILER_PATH}/bin/r8c-ranlib)
   set(CMAKE_SIZE                      ${COMPILER_PATH}/bin/r8c-size)
   set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/r8c-ld)

   set(CMAKE_ELF_TOOL                  ${COMPILER_PATH}/bin/r8c-elf-elfedit)
   set(CMAKE_GDB                      ${COMPILER_PATH}/bin/r8c-gdb)
   # set(CMAKE_FLASH                    ${COMPILER_PATH}/bin/avrdude)
   set(CMAKE_INSTALL_PREFIX             ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

elseif(${ARCHITECTURE} STREQUAL "ARM")
    # Set ARM toolchain variables
   set(CMAKE_AR                        ${COMPILER_PATH}/bin/arm-none-eabi-ar)
   set(CMAKE_ASM_COMPILER              ${COMPILER_PATH}/bin/arm-none-eabi-gcc)
   set(CMAKE_C_COMPILER                ${COMPILER_PATH}/bin/arm-none-eabi-gcc)
   set(CMAKE_CXX_COMPILER              ${COMPILER_PATH}/bin/arm-none-eabi-g++)

   set(CMAKE_RANLIB                    ${COMPILER_PATH}/bin/arm-none-eabi-ranlib)
   set(CMAKE_OBJCOPY                   ${COMPILER_PATH}/bin/arm-none-eabi-objcopy)
   set(CMAKE_OBJDUMP                   ${COMPILER_PATH}/bin/arm-none-eabi-objdump)
   set(CMAKE_SIZE                      ${COMPILER_PATH}/bin/arm-none-eabi-size)
   set(CMAKE_LINKER                    ${COMPILER_PATH}/bin/arm-none-eabi-ld)

   set(CMAKE_ELF_TOOL                  ${COMPILER_PATH}/bin/arm-none-eabi-elfedit)
   set(CMAKE_GDB                      ${COMPILER_PATH}/bin/rarm-none-eabi-gdb)
   # set(CMAKE_FLASH                    ${COMPILER_PATH}/bin/avrdude)
   set(CMAKE_INSTALL_PREFIX             ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
else()
    message(FATAL_ERROR "ARCHITECTURE : Not Supported")
endif()







################################### Compiler standard libraries  ########################################

##### STD Libraries
if(${ARCHITECTURE} STREQUAL "WINDOWS")
    ### Load the default compiler paths
   if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
   elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
      set(CMAKE_CXX_STANDARD_LIBRARIES -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
   elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
      set(CMAKE_C_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
   endif()

elseif(${ARCHITECTURE} STREQUAL "AVR")
    ### Load the default compiler paths
    if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
       set(CMAKE_CXX_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
       set(CMAKE_C_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    endif()

elseif(${ARCHITECTURE} STREQUAL "R8C")
    ### Load the default compiler paths
    if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
       set(CMAKE_CXX_STANDARD_LIBRARIES -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
       set(CMAKE_C_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    endif()

elseif(${ARCHITECTURE} STREQUAL "RL78")
    ### Load the default compiler paths
    if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
       set(CMAKE_CXX_STANDARD_LIBRARIES -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
       set(CMAKE_C_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    endif()

elseif(${ARCHITECTURE} STREQUAL "ARM")
    ### Load the default compiler paths
    if (NOT DEFINED PROJECT_LANGUAGE_VERSION)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "CXX")
       set(CMAKE_CXX_STANDARD_LIBRARIES -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    elseif (PROJECT_LANGUAGE_VERSION STREQUAL "C")
       set(CMAKE_C_STANDARD_LIBRARIES  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32)
    endif()

else()
    message(FATAL_ERROR "ARCHITECTURE : Not Supported")
endif()






################################### Compiler flags  ########################################

##### Flags set
if(${COMPILER_TYPE} STREQUAL "WINDOWS")
   #  set(PROJECT_DEFAULT_C_FLAGS   -c  -o -I${PROJECT_ALL_SOURCE_FILES} -Wall -g)
   #  set(PROJECT_DEFAULT_CXX_FLAGS  -g -o -Wall )
   #  set(PROJECT_DEFAULT_ASM_FLAGS -S)
    set(DEFAULT_LINK_FLAGS_DEBUG -Wl,--no-as-needed)
    set(DEFAULT_LINK_FLAGS_RELEASE -Wl,--no-as-needed)

elseif(${COMPILER_TYPE} STREQUAL "GENERIC")
    set(PROJECT_DEFAULT_C_FLAGS  -g -c -o -Wall -I. -I${PROJECT_ALL_SOURCE_FILES})
    set(PROJECT_DEFAULT_CXX_FLAGS  -g -o -Wall -I. -I${PROJECT_ALL_SOURCE_FILES})
    set(PROJECT_DEFAULT_ASM_FLAGS -S)
    set(DEFAULT_LINK_FLAGS_DEBUG -Wl,–verbose -Wl,–print-memory-usage -Wl,-s -Wl,–subsystem,console -nostartfiles -nostdlib -nodefaultlibs -Wl,-Map=${PROJECT_NAME}.map -Wl,T${PROJECT_LINKER_FOLDER_DIR}/${LINKER_FILE})
    set(DEFAULT_LINK_FLAGS_RELEASE )
    set(LINKER_FILE_CFG_PAR )
elseif(${COMPILER_TYPE} STREQUAL "GCC-AVR")
    set(PROJECT_DEFAULT_C_FLAGS -E -C -G --silent)
    set(PROJECT_DEFAULT_ASM_FLAGS -C -G )
    set(DEFAULT_LINK_FLAGS_DEBUG -C -G -f --map ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
    set(DEFAULT_LINK_FLAGS_RELEASE -C -G -f --map ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
    set(LINKER_FILE_CFG_PAR --config)
elseif(${COMPILER_TYPE} STREQUAL "GCC-RL78")
    set(PROJECT_DEFAULT_C_FLAGS -E -C -G --silent)
    set(PROJECT_DEFAULT_ASM_FLAGS -C -G )
    set(DEFAULT_LINK_FLAGS_DEBUG -C -G -f --map ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
    set(DEFAULT_LINK_FLAGS_RELEASE -C -G -f --map ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.map )
    set(    LINKER_FILE_CFG_PAR --config)
elseif(${COMPILER_TYPE} STREQUAL "GCC-ARM")
    set(PROJECT_DEFAULT_C_FLAGS -std=gnu99 -g -o -Wall )
    set(PROJECT_DEFAULT_ASM_FLAGS -S)
    set(DEFAULT_LINK_FLAGS_DEBUG -f -g -Wl,--whole-archive  -Wl,--no-whole-archive -o)
    set(DEFAULT_LINK_FLAGS_RELEASE -f -g -Wl,--whole-archive  -Wl,--no-whole-archive -o)
set(LINKER_FILE_CFG_PAR )
elseif(${COMPILER_TYPE} STREQUAL "IAR")
    message(FATAL_ERROR "COMPILER_TYPE : Not Supported")
else()
    message(FATAL_ERROR "COMPILER_TYPE : Not Supported")
endif()





### link
if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
   set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
   set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
endif()





# ##### Output set
# set(DEFAULT_EXECUTABLE_SUFFIX        "exe")
# set(DEFAULT_OUT_SUFFIX        "out")
# set(DEFAULT_HEX_SUFFUX        "hex")
# set(DEFAULT_ELF_SUFFUX        "elf")


	

# ##################################################################################################################################################################
# ##################################################################################################################################################################
# ##################################################################################################################################################################


# ############################# Set Microcontroller ########################
# set(CMAKE_SYSTEM_PROCESSOR          ${MICROCONTROLLER})


# ############################# Set Architecture ########################
# if(${ARCHITECTURE} STREQUAL "WINDOWS" AND PROJECT_ALL_SOURCE_FILES)

#         ### include directories
#         target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_ALL_INCLUDE_DIRS} PRIVATE ${PROJECT_COMPILER_INCLUDES})

#         ### compile
#         if (PROJECT_LANGUAGE STREQUAL "C")
#             target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${PROJECT_DEFAULT_C_FLAGS}>
#             $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}>  )
#         elseif (PROJECT_LANGUAGE STREQUAL "CXX")
#             target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_CXX_FLAGS} ${PROJECT_DEFAULT_CXX_FLAGS}>
#             $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}>  )
#         else()
#             message(FATAL_ERROR " xxx  ${PROJECT_LANGUAGE} is not supported  xxx  ")
#         endif()

#         ### link
#         if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#             set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#         elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#             set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#         endif()
#         target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${PROJECT_DEFAULT_LINK_FLAGS} ${CUSTOM_LINKER_FLAGS} ${LINKER_FILE_CFG_PAR} -T ${PROJECT_LINKER_FOLDER_DIR}/${LINKER_FILE})

# elseif(${ARCHITECTURE} STREQUAL "GENERIC")

#     set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".${DEFAULT_HEX_SUFFUX}")
    
#     # target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${PROJECT_DEFAULT_C_FLAGS}>
#     # $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}>
#     # )
    
#     set (OBJCPY ${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX})
#     set(POST_BUILD_COMMAND ${OBJCPY} -O ihex  ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.${DEFAULT_HEX_SUFFUX} -O binary  ${PROJECT_EXECUTABLES_FOLDER_DIR}/${PROJECT_NAME}.bin)


#     # set(CMAKE_C_RESPONSE_FILE_LINK_FLAG "-f ")
#     set(CMAKE_C_COMPILE_OBJECT "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS>  -o <OBJECT> -c <SOURCE>")
#     set(OBJECTS ${OBJECTS})
#     if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
#         set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_RELEASE})
#     elseif(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
#         set(PROJECT_DEFAULT_LINK_FLAGS ${DEFAULT_LINK_FLAGS_DEBUG})
#     endif()
#     target_link_options(${PROJECT_NAME} BEFORE PUBLIC ${PROJECT_DEFAULT_LINK_FLAGS} ${CUSTOM_LINK_FLAGS} ${LINKER_FILE_CFG_PAR} ${PROJECT_LINKER_FOLDER_DIR}/${LNKFILENAME}) 
# elseif(${ARCHITECTURE} STREQUAL "ARM")

#     set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".${DEFAULT_HEX_SUFFUX}" SUFFIX ".${DEFAULT_OUT_SUFFIX}")

#     # target_compile_options(${PROJECT_NAME} PRIVATE $<$<COMPILE_LANGUAGE:C>:${CUSTOM_C_FLAGS} ${PROJECT_DEFAULT_C_FLAGS}>
#     # $<$<COMPILE_LANGUAGE:ASM>:${CUSTOM_ASM_FLAGS} ${PROJECT_DEFAULT_ASM_FLAGS}>
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
# endif()

