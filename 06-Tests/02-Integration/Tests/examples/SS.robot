*** Settings ***
Resource    ../../Suites/Suite.robot

Documentation   ... Include required Libraries ... 


*** Variables ***
${SCREEN_SHOT_DIR}      D:\\Git_Projects\\project_0001_0000_CSWC\\06-Tests\\02-Integration\\Images
${screenshot_directory}   D:\\Git_Projects\\project_0001_0000_CSWC\\06-Tests\\02-Integration\\Images 


*** Test Cases ***
Take Screen shot of your desktop
    [Tags]    Functional
    [Documentation]    This test Takes screen shot of your desktop.
    ...    Step 1: 
    ...    
    Given StartRobot
    When Path is Set
    Then Take Screen Shot












*** Keywords ***
Given StartRobot
    Log    Start!

When Path is Set
    Set Screenshot Directory    ${SCREEN_SHOT_DIR}

Then Take Screen Shot
    ${SS_status}=    Take Screenshot    name=SWC_001    width=800px
    Log    ${SS_status}