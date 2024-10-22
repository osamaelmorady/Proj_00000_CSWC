#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    DebuggerSettings.cmake                  #######
   #######       Target :    WINDOWS                                 #######
   #######       Brief  :    Set the debugger options                #######
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
##### Debugger set
if(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "GDB")
    ### Load the default compiler paths
    set(CMAKE_DEBUG_COMMAND      )

elseif(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "AVRDUDE")
   set(CMAKE_DEBUG_TOOL        ${CMAKE_DEBUG_TOOL_PATH})
    set(CMAKE_DEBUG_COMMAND      ${CMAKE_DEBUG_TOOL}/avrdude -c usbasp -p ${MICROCONTROLLER} -U flash:w:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.hex:i -B -F -rst  DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "OpenOCD")
   set(CMAKE_DEBUG_TOOL         ${CMAKE_DEBUG_TOOL_PATH}/openocd) 
   set(CMAKE_DEBUG_COMMAND      ${CMAKE_DEBUG_TOOL} -f stlink.cfg -f stm32f4x_stlink.cfg -c port=SWD -w ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "ST-LINK")
   set(CMAKE_DEBUG_TOOL         ${CMAKE_DEBUG_TOOL_PATH}/ST-LINK_CLI) 
   set(CMAKE_DEBUG_COMMAND      STM32_Programmer_CLI -c port=SWD -w ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")

elseif(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "J-Link")
   set(CMAKE_DEBUG_TOOL         ${CMAKE_DEBUG_TOOL_PATH}/JLinkExe) 
   set(CMAKE_DEBUG_COMMAND      ${CMAKE_DEBUG_TOOL} ${MICROCONTROLLER} -if SWD -speed 4000 -AutoConnect 1 -silent -CommanderScript your_script.jlink   -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_DEBUG_TOOL_TYPE} STREQUAL "pyOCD")
   set(CMAKE_DEBUG_TOOL         ${CMAKE_DEBUG_TOOL_PATH}/pyocd) 
   set(CMAKE_DEBUG_COMMAND    ${CMAKE_DEBUG_TOOL} flash ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.bin -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")
   
else()
    message(FATAL_ERROR "CMAKE_DEBUG_TOOL_TYPE : Not Supported")
endif()






##### Flasher set
if(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "GDB")
    ### Load the default compiler paths
    set(CMAKE_FLASH_COMMAND      )


elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "USBASP")
   set(CMAKE_FLASH_TOOL        ${CMAKE_FLASH_TOOL_PATH})
   set(CMAKE_FLASH_COMMAND      ${CMAKE_FLASH_TOOL}/avrdude -c usbasp -p ${MICROCONTROLLER} -U flash:w:${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.hex:i -B -F -rst  DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")

elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "ST-LINK")
   set(CMAKE_FLASH_TOOL         ${CMAKE_FLASH_TOOL_PATH}/STM32_Programmer_CLI) 
   set(CMAKE_FLASH_COMMAND      ST-LINK_CL -c port=SWD -w ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "E2-LITE")
   # set(CMAKE_FLASH_TOOL         ${CMAKE_DEBUG_TOOL_PATH}/STM32_Programmer_CLI) 
   # set(CMAKE_FLASH_COMMAND      ST-LINK_CL -c port=SWD -w ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "J-Link")
set(CMAKE_FLASH_TOOL         ${CMAKE_FLASH_TOOL_PATH}/JLinkExe) 
set(CMAKE_FLASH_COMMAND      ${CMAKE_FLASH_TOOL} ${MICROCONTROLLER} -if SWD -speed 4000 -AutoConnect 1 -silent -CommanderScript your_script.jlink   -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "OpenOCD")
   set(CMAKE_FLASH_TOOL         ${CMAKE_FLASH_TOOL_PATH}/openocd) 
   set(CMAKE_FLASH_COMMAND      ${CMAKE_FLASH_TOOL} -f stlink.cfg -f stm32f4x_stlink.cfg -c port=SWD -w ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")



elseif(${CMAKE_FLASH_TOOL_TYPE} STREQUAL "pyOCD")
   set(CMAKE_FLASH_TOOL         ${CMAKE_FLASH_TOOL_PATH}/pyocd) 
   set(CMAKE_FLASH_COMMAND    ${CMAKE_FLASH_TOOL} flash ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.bin -B -F -rst DEPENDS ${PROJECT_NAME} "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}.elf verify reset exit")


else()
    message(FATAL_ERROR "CMAKE_FLASH_TOOL_TYPE : Not Supported")
endif()












