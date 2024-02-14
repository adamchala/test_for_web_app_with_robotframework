*** Settings ***
Documentation    Test suit for Form App
Library    SeleniumLibrary
Resource    ../resources/resource.robot
Resource    ../resources/form_app.robot
Test Setup    Open Chrome Browser
Test Teardown    Close Browser


*** Variables ***
${First Name}    Adam
${Last Name}    Chała
${Email}    adam@chała.com
${Mobile}    999222333
${Gender}    Male
${Day}    10
${Month}    09
${Year}    1993

${Wrong Email}    adamchała.com
${Wrong Mobile}    123


*** Test Cases ***
Form App Test
    [Documentation]    Positive test where every field is fill in
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Email    ${Email}
    Fill Mobile    ${Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Validate Submission    ${First Name}    ${Last Name}    ${Email}    ${Mobile}    ${Gender}    ${Day}    ${Month}    ${Year}


Form App Empty First Name Field
    [Documentation]    Test form behavior when first name field is not fill in
    Open Form App
    Am I On Form Page
    Fill Last Name    ${Last Name}
    Fill Email    ${Email}
    Fill Mobile    ${Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    First Name Problem Message Should Be Visible


Form App Empty Last Name Field
    [Documentation]    Test form behavior when last name field is not fill in
    Open Form App
    Am I On Form Page
    Fill First Name    ${Last Name}
    Fill Email    ${Email}
    Fill Mobile    ${Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Last Name Problem Message Should Be Visible

    
Form App Empty Email Field
    [Documentation]    Test form behavior when emile field is not fill in
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Mobile    ${Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Email Problem Message Should Be Visible

    
Form App Wrong Value In Email Field
    [Documentation]    Test form behavior when emile has incorrect format
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Email    ${Wrong Email}
    Fill Mobile    ${Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Email Problem Message Should Be Visible

    
Form App Empty Mobile Field
    [Documentation]    Test form behavior when mobile field is not fill in
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Email    ${Email}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Mobile Problem Message Should Be Visible

    
Form App Wrong Value In Mobile Field
    [Documentation]    Test form behavior when mobile has incorrect format
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Email    ${Email}
    Fill Mobile    ${Wrong Mobile}
    Choose Gender    ${Gender}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Mobile Problem Message Should Be Visible

    
Form App Empty Gender Field
    [Documentation]    Test form behavior when any gender radio button is not checked
    Open Form App
    Am I On Form Page
    Fill First Name    ${First Name}
    Fill Last Name    ${Last Name}
    Fill Email    ${Email}
    Fill Mobile    ${Mobile}
    Fill Date    ${Day}    ${Month}    ${Year}
    Submit Form
    Gender Problem Message Should Be Visible
    