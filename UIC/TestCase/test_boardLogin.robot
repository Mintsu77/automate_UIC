*** Settings ***
Library    SeleniumLibrary

Suite Setup        Log     UIC Project     

*** Test Case ***  
Board_Login_001
    [Documentation]         เข้าสู่ระบบสำเร็จ(กรอกอีเมลและรหัสผ่านถูกต้อง)
    Open Browser            ${URL}         chrome
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[0]
    Sleep                   2
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[2]/div/div/input    @{USERNAME_PASSWORD}[1]
    Sleep                   2  
    Click Button            //*[@id="first-template"]/div/div/div[2]/form/button
    Wait Until Element Is Visible   xpath=//*[@id="master-data"]/div[2]/div[2]/div/div/div/div[1]/h2       
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}    
      
Board_Login_002
    [Documentation]         เข้าสู่ระบบไม่สำเร็จ(กรอกอีเมลที่ไม่มีในระบบหรือกรอกอีเมลไม่ถูกต้อง)
    Open Browser            ${URL}         chrome
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[2]
    Sleep                   2
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[2]/div/div/input    @{USERNAME_PASSWORD}[1]
    Sleep                   2  
    Click Button            //*[@id="first-template"]/div/div/div[2]/form/button
    Alert Message 1 "อีเมลหรือรหัสผ่านไม่ถูกต้อง!"
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os} 
    
Board_Login_003
    [Documentation]         เข้าสู่ระบบไม่สำเร็จ(กรอกรหัสผ่านไม่ถูกต้อง)
    Open Browser            ${URL}         chrome
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[0]
    Sleep                   2
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[2]/div/div/input    @{USERNAME_PASSWORD}[3]
    Sleep                   2  
    Click Button            //*[@id="first-template"]/div/div/div[2]/form/button
    Alert Message 1 "อีเมลหรือรหัสผ่านไม่ถูกต้อง!"
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os}
    
 Board_Login_004
    [Documentation]         เข้าสู่ระบบไม่สำเร็จ(กรอกอีเมลแต่ไม่กรอกรหัสผ่าน)
    Open Browser            ${URL}         chrome
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[1]/div/div/input    @{USERNAME_PASSWORD}[0]
    Sleep                   2  
    Click Button            //*[@id="first-template"]/div/div/div[2]/form/button
    Alert Message 2 "กรุณากรอกรหัสผ่าน"
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os} 
    
Board_Login_005
    [Documentation]         เข้าสู่ระบบไม่สำเร็จ(กรอกรหัสผ่านแต่ไม่กรอกอีเมล)
    Open Browser            ${URL}         chrome
    Input Text              //*[@id="first-template"]/div/div/div[2]/form/div[2]/div/div/input    @{USERNAME_PASSWORD}[1]
    Sleep                   2  
    Sleep                   2  
    Click Button            //*[@id="first-template"]/div/div/div[2]/form/button
    Alert Message 3 "กรุณากรอกอีเมล"
    Log                     Login Test Completed!!
    Log                     This test was executed by %{username} on %{os} 
 
       
*** Variables ***
#SCALAR Variables
${URL}            https://uat.uic.lffintech.co.th/login

#LIST Variables
@{USERNAME_PASSWORD}    admin_mint@gmail.com  123456789  adminTest@gmail.com  1234567890

*** Keywords ***
Alert Message 1 "อีเมลหรือรหัสผ่านไม่ถูกต้อง!"
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div/h2
    
Alert Message 2 "กรุณากรอกรหัสผ่าน"
    Wait Until Element Is Visible   xpath=//*[@id="first-template"]/div/div/div[2]/form/div[2]/div/div[2]
    
Alert Message 3 "กรุณากรอกอีเมล"
    Wait Until Element Is Visible   xpath=//*[@id="first-template"]/div/div/div[2]/form/div[1]/div/div[2]
    

