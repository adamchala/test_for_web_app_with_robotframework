*** Settings ***
Documentation    File with selectors and interaction for form app
Library    SeleniumLibrary

*** Variables ***
${Page Title}    //span[@class='st-emotion-cache-10trblm e1nzilvr1']
${Main Iframe}    //*[@id="root"]/div[1]/div/div/iframe

${First Name Field}    //input[@aria-label="First name"]

${Last Name Field}    //input[@aria-label="Last name"]

${Email Field}    //input[@aria-label='Email']

${Mobile Field}    //input[@aria-label='Mobile']

${Gender Male Radio Selector}    //p[normalize-space()='Male']
${Gender Female Radio Selector}    //p[normalize-space()='Female']
${Gender Other Radio Selector}    //p[normalize-space()='Other']
${Male}    Male
${Female}    Female
${Other}    Other

${Date Field}    //input[@placeholder='DD.MM.YYYY']

${Submit Button}    //button[normalize-space()='Submit']

${First Name Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[1]
${Last Name Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[2]
${Email Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[3]
${Mobile Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[4]
${Gender Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[5]
${Date Validation}    (//div[@class='st-emotion-cache-1j6rxz7 e1eexb540'])[6]

${First Name Problem Message}    //p[normalize-space()='First Name can not be empty!']
${Last Name Problem Message}    //p[normalize-space()='Last Name can not be empty!']
${Email Problem Message}    //p[normalize-space()='Email is incorrect!']
${Mobile Problem Message}    //p[normalize-space()='Mobile is incorrect!']
${Gender Problem Message}    //p[normalize-space()='Gender checkbox is not checked!']


*** Keywords ***
Am I On Form Page
    Wait Until Element Is Visible    ${Page Title}    10
    Wait Until Element Is Visible    ${First Name Field} 
    Page Should Contain    Personal Form
    Select Frame    ${Main Iframe}

    
Fill First Name
    [Arguments]    ${First Name}
    Input Text    ${First Name Field}     ${First Name}


Fill Last Name
    [Arguments]    ${Last Name}
    Input Text    ${Last Name Field}     ${Last Name}

Fill Email
    [Arguments]    ${Email}
    Input Text    ${Email Field}     ${Email}
    
Fill Mobile
    [Arguments]    ${Mobile}
    Input Text    ${Mobile Field}     ${Mobile}

Choose Gender
    [Arguments]    ${Gender}
    IF    '${Gender}' == '${Male}'
        Click Element    ${Gender Male Radio Selector}
    ELSE IF    '${Gender}' == '${Female}'
        Click Element    ${Gender Female Radio Selector}
    ELSE IF    '${Gender}' == '${Other}'
        Click Element    ${Gender Other Radio Selector}
    ELSE
        Fail    Valid values for gender are: Male, Female, Other but ${Gender} was given
    END

Fill Date
    [Arguments]    ${Day}    ${Month}    ${Year}
    Press Keys    ${Date Field}    CTRL+a+BACKSPACE
    Input Text    ${Date Field}     ${Day}.${Month}.${Year}
    Press Keys    ${Date Field}    ESC

Submit Form
    Click Button    ${Submit Button}
    
Validate Submission
    [Arguments]    ${First Name}    ${Last Name}    ${Email}    ${Mobile}    ${Gender}    ${Day}    ${Month}    ${Year}
    Wait Until Element Is Visible    ${First Name Validation}    10
    Element Text Should Be    ${First Name Validation}    ${First Name}
    Element Text Should Be    ${Last Name Validation}    ${Last Name}
    Element Text Should Be    ${Email Validation}    ${Email}
    Element Text Should Be    ${Mobile Validation}    ${Mobile}
    Element Text Should Be    ${Gender Validation}    ${Gender}
    Scroll Element Into View    ${Date Validation}
    Element Text Should Be    ${Date Validation}    ${Year}-${Month}-${Day}
    
First Name Problem Message Should be Visible
    Wait Until Element Is Visible    ${First Name Problem Message}    10
    Element Should Be Visible    ${First Name Problem Message}

Last Name Problem Message Should be Visible
    Wait Until Element Is Visible    ${Last Name Problem Message}    10
    Element Should Be Visible    ${Last Name Problem Message}

Email Problem Message Should be Visible
    Wait Until Element Is Visible    ${Email Problem Message}    10
    Element Should Be Visible    ${Email Problem Message}

Mobile Problem Message Should be Visible
    Wait Until Element Is Visible    ${Mobile Problem Message}    10
    Element Should Be Visible    ${Mobile Problem Message}

Gender Problem Message Should be Visible
    Wait Until Element Is Visible    ${Gender Problem Message}    10
    Element Should Be Visible    ${Gender Problem Message}


