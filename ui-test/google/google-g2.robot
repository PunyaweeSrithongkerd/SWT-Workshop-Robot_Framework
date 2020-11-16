*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News

*** Test Cases ***
Test search keyword and verify search result on Google
    พิมพ์ google.com
    พิมพ์คำค้น
    กด Enter
    ตรวจสอบ US Election 2020 - BBC News

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}
พิมพ์คำค้น
    Input Text    name:q    ${KEYWORD}
กด Enter
    Press Keys    name:q    RETURN
ตรวจสอบ US Election 2020 - BBC News
    Page Should Contain    ${EXPECTED_RESULT}
    Close Browser