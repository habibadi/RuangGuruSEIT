*** Settings ***
Library  RequestsLibrary
Resource  ../../Resources/API/TestSearch.robot
*** Variables ***
${base_url}  https://skillacademy.com/
${city}  Delhi

*** Test Cases ***
Test Search API
    TestSearch.Check Basic Search
    TestSearch.Check Pagination Search
    TestSearch.Check Price Search
    TestSearch.Check Duration Search
    TestSearch.Check Order Search