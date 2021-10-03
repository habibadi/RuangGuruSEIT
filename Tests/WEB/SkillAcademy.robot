*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://skillacademy.com/
${SEARCH_TERM} =  Programming

*** Settings ***
Documentation  This is SkillAcademy Search Web Test
Resource  ../../Resources/WEB/Common.robot  # for Setup & Teardown
Resource  ../../Resources/WEB/SkillAcademy.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test  ${BROWSER}
Test Teardown  Common.End Web Test

*** Test Cases ***
Logged out user can search for products
    [Tags]  Current
    SkillAcademy.Search for Products  ${SEARCH_TERM}


