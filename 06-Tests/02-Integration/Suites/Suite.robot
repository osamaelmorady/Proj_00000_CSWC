*** Settings ***
Name            MySuite
Library    OperatingSystem
Library    Process
Library    Screenshot
Library    Dialogs
Library    DateTime
Library    String
Library    XML
Library    Collections
Library    SeleniumLibrary


Metadata        Project Name    My Robot Project    
Metadata        Author          Osama ElMorady
Metadata        Version            1.0
Metadata        Robot Framework    http://robotframework.org
Metadata        Platform           ${PLATFORM}
Metadata        Longer Value
Metadata        Environment     Staging
Metadata    Execution Date    ${CURRENT_DATE}
Metadata    Execution Time    ${CURRENT_TIME}


Test Timeout       2 minutes



*** Variables ***
${MESSAGE}       Hello, world!
${ProjectName}    My Robot Project
${Author}    Osama ElMorady
${Version}    1.0


*** Keywords ***
Print Meta Data
    [Setup]    Log    Starting!
    # Log    Metadata: ${SUITE METADATA}
    # Log    Project Name: ${SUITE METADATA["Project Name"]}
    # Log    Author: ${SUITE METADATA["Author"]}
    # Log    Version: ${SUITE METADATA["Version"]}
    # Log    Platform: ${SUITE METADATA["Version"]}
    # Log    Environment: ${SUITE METADATA["Version"]}
    # Log    Version: ${SUITE METADATA["Version"]}
    # Log    Execution Date: ${SUITE METADATA["Execution Date"]}
    # Log    Execution Time: ${SUITE METADATA["Execution Time"]}
    ${CURRENT_DATE}=    Get Current Date    result_format=%Y-%m-%d
    ${CURRENT_TIME}=    Get Current Date    result_format=%H:%M:%S
    [Teardown]    Log    Ending.

Do Something
    [Arguments]    ${args}
    Log     Do Something



Check In Range
    [Arguments]    ${value1}    ${value2}    ${window}

    IF    ${value1} >= ${value2}-${window} && ${value1} <= ${value2}+${window} 
        ${result}=    ${TRUE}
    ELSE
        ${result}=    ${FALSE}
    END

    RETURN    ${result}


I have ${data1} And ${Data2}
    Log   Evaluate${data1}+${Data2}


Compare Files
    [Arguments]    ${file1}    ${file2}
    ${content1}=    Get File   ${file1}
    ${content2}=    Get File   ${file2}
    Should Be Equal As Strings    ${content1}    ${content2}



