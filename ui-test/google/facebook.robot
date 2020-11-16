*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${USERNAME}
${PASSWORD}
${POSTCLASS}    div.oajrlxb2.b3i9ofy5
${massage}    Hello Robotframework
${POST}    div.s1i5eluu
*** Test Cases ***
Test Facebook
    พิมพ์ facebook.com
    พิมพ์email
    พิมพ์password
    กด Enter
    คลิ้กpost
    เขียนpostและpost


*** Keywords ***
พิมพ์ facebook.com
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To     https://facebook.com
พิมพ์email
    Input Text    name:email    ${USERNAME}
พิมพ์password
    Input Text    name:pass    ${PASSWORD}
กด Enter
    Press Keys    name:login    RETURN
คลิ้กpost
    Click Element    tag:${POSTCLASS}
เขียนpostและpost
    Sleep    5s
    Press Keys    None    Hello Robotframework
    Click Element    tag:${POST}

