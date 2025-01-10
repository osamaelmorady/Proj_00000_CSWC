*** Settings ***
Documentation   ... Common used keywords ...
...    
Resource    ../../Suites/Suite.robot

Suite Setup    Print Meta Data

*** Variables ***




*** Test Cases ***
Starter Test
    [Tags]    Functional
    [Documentation]    This is a dummy resource    
    [Timeout]    10
  
    Log To Console   Start!

    I have 1 And 2

    


*** Keywords ***
Given StartRobot
    [Documentation]    Starter function to log start 
    Log    Start!




*** Comments ***






