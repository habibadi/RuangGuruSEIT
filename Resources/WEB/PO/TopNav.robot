*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary
Variables  ../WebElement.py
*** Keywords ***
Search for Products
    [Arguments]  ${SEARCH_TERM}
    Enter Search Term  ${SEARCH_TERM}
    Submit Search

Enter Search Term
    [Arguments]  ${SEARCH_TERM}
    Input Text  ${HomePageSearchTextBox}  ${SEARCH_TERM}

Submit Search
    Press Keys  ${SearchButton}  [Return]