*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Search Completed
    [Arguments]  ${SEARCH_TERM}
    Wait Until Page Contains  Hasil untuk ${SEARCH_TERM}

