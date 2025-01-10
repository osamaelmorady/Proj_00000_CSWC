*** Settings ***
Resource    ../../Suites/Suite.robot

Documentation   ... Test Chrome ...


*** Test Cases ***
Start a Chrome Page
    [Tags]    Smoke
    Given the browser is open
    When I navigate to the page    https://www.google.com/
    Then the page title should be    Google

*** Keywords ***
Given the browser is open
    Open Browser    url=https://www.google.com/    browser=Google Chrome

When I navigate to the page
    [Arguments]    ${url}
    Go To    ${url}

Then the page title should be
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}