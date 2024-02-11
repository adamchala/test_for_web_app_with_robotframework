*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://app-for-test-automation-exercise.streamlit.app
${title}    Streamlit
${Main Iframe}    //*[@id="root"]/div[1]/div/div/iframe

${Test Form Button}    //p[normalize-space()='Test Form']


*** Keywords ***
Open Chrome Browser
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${Main Iframe}
    Select Frame    ${Main Iframe}
    Title Should Be    ${title}


Open Form App
    Wait Until Element Is Visible    ${Test Form Button}    10
    Click Element    ${Test Form Button}

