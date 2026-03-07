#[[#########################################################################
   ####################### FILE DEFINITION SECTION ######################### 
   #########################################################################
   #######       File   :    CTestSettings.cmake                  #######
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
   |  $Author:: Osama ElMorady  | $Version::  1.0      | $Date:: 13 Sep,2025    | $Status:: Draft  | $Description::  Initial Commit      |          
   #####################################################################################################################################################
 #]]



############################ Cmake Version ########################
cmake_minimum_required(VERSION 3.28.0)


include(CTest)            # enables ctest / BUILD_TESTING
include(FetchContent)

# Pull GoogleTest (works on Windows/Linux/macOS)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)
FetchContent_MakeAvailable(googletest)


include(GoogleTest)


function(link_with_gtest tgt)
  if(TARGET gtest_main)
    target_link_libraries(${tgt} PRIVATE gtest_main)
  elseif(TARGET GTest::gtest_main)
    target_link_libraries(${tgt} PRIVATE GTest::gtest_main)
  else()
    message(FATAL_ERROR "GoogleTest not available; did you add it?")
  endif()

  # Link your production library too, if it exists
  if(DEFINED PROJECT_TARGET AND TARGET ${PROJECT_TARGET})
    target_link_libraries(${tgt} PRIVATE ${PROJECT_TARGET})
  endif()


  # Common test flags (optional)
  target_compile_definitions(${tgt} PRIVATE UNIT_TEST=1)
endfunction()