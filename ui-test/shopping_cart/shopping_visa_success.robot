*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers
*** Variables ***
${card_number}    4719700591590995
${cvv}    752
${expired_month}    7
${expired_year}    20
${card_name}    Karnwat Wongudom

*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry ชำระเงินบัตรเครดิตด้วย visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำสินค้าใส่ตระกร้า
    ยืนยันการส่งซื้อและชำระเงินด้วยบัตรVISA
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://dminer.in.th/Product-list.html    chrome
แสดงรายละเอียดสินค้า
    Page Should Contain    43 Piece Dinner Set
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD
ระบุจำนวนสินค้าที่จะซื้อ
    Click Button    viewMore-1
    Wait Until Element Contains    id=productName    43 Piece dinner Set
    Page Should Contain    Brand
    Page Should Contain    CoolKidz
    Input Text    id=productQuantity    2
นำสินค้าใส่ตระกร้า
    Click Button    addToCart
ยืนยันการส่งซื้อและชำระเงินด้วยบัตรVISA
    Wait Until Element Contains    id=totalAmount    14.95 USD
    Element Should Contain    id=totalProductPrice    expected=12.95 USD
    Click Button    confirmPayment
    Wait Until Element Contains    id=Payment    ยืนยันการชำระเงิน
    Input Text    id=cardNumber    ${card_number}
    Input Text    id=expiredMonth    ${expired_month}
    Input Text    id=expiredYear    ${expired_year}
    Input Text    id=cvv    ${cvv}
    Input Text    id=cardName    ${card_name}
    Click Button    Payment
ขอบคุณ
    Wait Until Element Contains    id=title    ชำระเงินสำเร็จ