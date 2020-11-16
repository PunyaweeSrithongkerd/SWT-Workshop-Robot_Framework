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