*** Settings ***
Library  SeleniumLibrary
Library  String
Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***
${BROWSER} =  edge
${GOOGLE_URL} =  https://www.google.com/
${FACEBOOK_URL} =  https://www.facebook.com/
${SEARCH_KEYWORD} =  Robot Framework
${FACEBOOK_EMAIL} =  gwzwtxh_bharambeman_1664185345@tfbnw.net
${FACEBOOK_PASSWORD} =  mwvukk1qo27


*** Test Cases ***
User can search in google
    Open Google Website
    Perform Google Search

User can post in facebook
    Open Facebook Website
    Login to Facebook
    Create New Post


*** Keywords ***
Open Google Website
    Loading Google Web
    Verifying Google Web loaded

Loading Google Web
    Go To  ${GOOGLE_URL}

Verifying Google Web Loaded
    Page Should Contain Image  Google

Perform Google Search
    Enter Search Keywords  ${SEARCH_KEYWORD}
    Click Search Button
    Verifying Search Results  ${SEARCH_KEYWORD}

Enter Search Keywords
    [Arguments]  ${SEARCH_KEYWORD}
    Input Text  name:q  ${SEARCH_KEYWORD}

Click Search Button
    Click Button  xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[3]/center/input[1]

Verifying Search Results
    [Arguments]  ${SEARCH_KEYWORD}
    Page Should Contain  ${SEARCH_KEYWORD}


Open Facebook Website
    Loading Facebook Web
    Verifying Facebook Web loaded

Loading Facebook Web
    Go To  ${FACEBOOK_URL}

Verifying Facebook Web loaded
    Page Should Contain Image  Facebook

Login to Facebook
    Enter Email  ${FACEBOOK_EMAIL}
    Enter Password  ${FACEBOOK_PASSWORD}
    Click Login Button
    Verifying Facebook Login

Enter Email
    [Arguments]  ${FACEBOOK_EMAIL}
    Input Text  id:email  ${FACEBOOK_EMAIL}

Enter Password
    [Arguments]  ${FACEBOOK_PASSWORD}
    Input Text  id:pass  ${FACEBOOK_PASSWORD}

Click Login Button
    Click Button  name:login

Verifying Facebook login
    Page Should Contain  Messenger

Create New Post
    Click Create New Post Button
    ${FACEBOOK_MSG} =  Generate Random String  8  [LOWER]
    Enter Post Message  ${FACEBOOK_MSG}
    Click Post Button
    Verifying Post Message  ${FACEBOOK_MSG}

Click Create New Post Button
    Click Element  xpath:/html/body/div[1]/div[1]/div[1]/div/div[2]/div[4]/div[1]/div[3]/span/div
    Wait Until Element Is Visible  xpath:/html/body/div[1]/div[1]/div[1]/div/div[2]/div[4]/div[2]/div/div/div[1]/div[1]/div/div/div/div/div/div/div/div[2]/div[1]/div  2
    Click Element  xpath:/html/body/div[1]/div[1]/div[1]/div/div[2]/div[4]/div[2]/div/div/div[1]/div[1]/div/div/div/div/div/div/div/div[2]/div[1]/div
    Wait Until Element Is Visible  xpath:/html/body/div[4]/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div/div[2]/div[1]/div[1]/div[1]

Enter Post Message
    [Arguments]  ${POST_MSG}
    Input Text  xpath:/html/body/div[4]/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div/div[2]/div[1]/div[1]/div[1]/div/div/div/p  ${POST_MSG}

Click Post Button
    Click Element  xpath:/html/body/div[4]/div[1]/div/div[2]/div/div/div/form/div/div[1]/div/div/div/div[3]/div[2]/div
    Sleep  1
    Loading Facebook Web

Verifying Post Message
    [Arguments]  ${FACEBOOK_MSG}
    Page Should Contain  ${FACEBOOK_MSG}

Begin Web Test
    Open Browser  abount:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

