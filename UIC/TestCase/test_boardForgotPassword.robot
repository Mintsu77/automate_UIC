*** Settings ***
Library    SeleniumLibrary

Suite Setup        Log     UIC Project     

*** Test Case ***  
Board_Forgot_Password_001
    [Documentation]         ส่งรหัสผ่านเข้าอีเมล สำเร็จ(มีอีเมลในระบบ)
    Open Browser            ${URL}         chrome
    Click Element            xpath=//*[@id="first-template"]/div/div/div[2]/form/p/span
    Sleep                   2
    Input Text              xpath=//*[@id="first-template"]/div/div/div[2]/div/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[0]
    Sleep                   2  
    Click Button            xpath=//*[@id="first-template"]/div/div/div[2]/div/form/button
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div/h2      
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}
    
Board_Forgot_Password_002
    [Documentation]         ส่งรหัสผ่านเข้าอีเมล ไม่สำเร็จ(ไม่มีอีเมลในระบบ)
    Open Browser            ${URL}         chrome
    Click Element            xpath=//*[@id="first-template"]/div/div/div[2]/form/p/span
    Sleep                   2
    Input Text              xpath=//*[@id="first-template"]/div/div/div[2]/div/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[1]
    Sleep                   2  
    Click Button            xpath=//*[@id="first-template"]/div/div/div[2]/div/form/button
    Alert Message 1 "ข้อมูลไม่ถูกต้อง"      
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}   
    
Board_Forgot_Password_003
    [Documentation]         ส่งรหัสผ่านเข้าอีเมล ไม่สำเร็จ(กรอกอีเมลไม่ถูกต้อง)
    Open Browser            ${URL}         chrome
    Click Element           xpath=//*[@id="first-template"]/div/div/div[2]/form/p/span
    Sleep                   2
    Input Text              xpath=//*[@id="first-template"]/div/div/div[2]/div/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[2]
    Sleep                   2  
    Click Button            xpath=//*[@id="first-template"]/div/div/div[2]/div/form/button
    Alert Message 2 "กรุณากรอกอีเมลให้ถูกต้อง"      
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}
    
Board_Forgot_Password_004
    [Documentation]         ส่งรหัสผ่านเข้าอีเมล ไม่สำเร็จ(กรอกอีเมลไม่ถูกต้อง)
    Open Browser            ${URL}         chrome
    Click Element           xpath=//*[@id="first-template"]/div/div/div[2]/form/p/span
    Sleep                   2 
    Click Button            xpath=//*[@id="first-template"]/div/div/div[2]/div/form/button
    Alert Message 3 "กรุณากรอกอีเมล"      
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}

*** Variables ***
#SCALAR Variables
${URL}            https://uat.uic.lffintech.co.th/login

#LIST Variables
@{USERNAME_PASSWORD}    Mint_CK77@hotmail.com  abc@gmail.com  adminTest  1234567890

#DICTIONARY
&{LOGINDATA}      valid_userName=admin_mint@gmail.com    valid_password=123456789  invalid_userName1=abc@gmail.com  invalid_password=1234567890

*** Keywords ***
Alert Message 1 "ข้อมูลไม่ถูกต้อง"
    Wait Until Element Is Visible   xpath=/html/body/div[2]/p
    
Alert Message 2 "กรุณากรอกอีเมลให้ถูกต้อง"
    Wait Until Element Is Visible   xpath=//*[@id="first-template"]/div/div/div[2]/div/form/div[1]/div/div[2]
    
Alert Message 3 "กรุณากรอกอีเมล"
    Wait Until Element Is Visible   xpath=//*[@id="first-template"]/div/div/div[2]/div/form/div[1]/div/div[2]
     