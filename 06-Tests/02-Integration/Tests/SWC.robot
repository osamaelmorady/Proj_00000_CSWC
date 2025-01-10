*** Settings ***
Documentation   ... Include required Libraries ...
                ... Define Tescases ...
                ... Define Keywords ...      
Library     OperatingSystem
Library     Collections
Library     Process
Library    Screenshot



*** Variables ***






*** Test Cases ***
Start a Chrome Page
    [Tags]    Smoke
    [Documentation]    This test builds the C code and verifies the generated HEX file.
    ...    Step 1: Clean Previous Builds
    ...    Run Process         rm     -f    output.elf output.hex
    ...    
    ...    Step 2: Compile C Code
    ...    Run Process         ${BUILD_COMMAND}
    ...    Should Be True      ${rc} == 0    # Check for successful compilation
    ...    
    ...    Step 3: Generate HEX File
    ...    Run Process         ${HEX_COMMAND}
    ...    Should Be True      ${rc} == 0    # Check for successful HEX generation
    ...    
    ...    Step 4: Verify HEX File Exists
    ...    File Should Exist   ${GENERATED_HEX}
    ...    
    ...    Step 5: Compare HEX Files
    ...    Compare Files       ${GENERATED_HEX}    ${EXPECTED_HEX} 
    ...    

    StartRobot


*** Keywords ***
StartRobot
    Log    Hello World!
    log to console   Hello World!


