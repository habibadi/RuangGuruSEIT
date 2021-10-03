*** Settings ***
Resource  ../../Resources/WEB/PO/LandingPage.robot
Resource  ../../Resources/WEB/PO/TopNav.robot
Resource  ../../Resources/WEB/PO/SearchResults.robot


*** Keywords ***
Search for Products
    [Arguments]  ${SEARCH_TERM}
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products  ${SEARCH_TERM}
    SearchResults.Verify Search Completed  ${SEARCH_TERM}


