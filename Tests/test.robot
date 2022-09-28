*** Settings ***
Library  SeleniumLibrary
Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***
${BROWSER} =  edge
${SLIDESHARE_URL} =  https://www.slideshare.net/
${SEARCH_KEYWORD} =  Robot framework
${SLIDE_NAME} =  Scripting robot
${PAGE_NUMBER} =  7


*** Test Cases ***
User can open "scripting robot" slide
    Open Slideshare Website
    Perform Search  ${SEARCH_KEYWORD}
    Go To Page  ${PAGE_NUMBER}
    Select Slide  ${SLIDE_NAME}
    Sleep  5


*** Keywords ***
Open Slideshare Website
    Loading Slideshare Web
    Verifying Slideshare Web loaded

Loading Slideshare Web
    Go To  ${SLIDESHARE_URL}

Verifying Slideshare Web Loaded
    Page Should Contain Image  SlideShare a Scribd company logo

Perform Search
    [Arguments]  ${SEARCH_KEYWORD}
    Enter Search Keywords  ${SEARCH_KEYWORD}
    Click Search Button
    Verifying Search Results  ${SEARCH_KEYWORD}

Enter Search Keywords
    [Arguments]  ${SEARCH_KEYWORD}
    Input Text  id:nav-search-query  ${SEARCH_KEYWORD}

Click Search Button
    Click Button  id:search-submit

Verifying Search Results
    [Arguments]  ${SEARCH_KEYWORD}
    Page Should Contain  results for ${SEARCH_KEYWORD}

Go To Page
    [Arguments]  ${page_number}
    Scroll To Pagination
    Click Link  ${page_number}
    Verifying Pagination Number  ${page_number}

Scroll To Pagination
    Scroll Element Into View  class:current

Verifying Pagination Number
    [Arguments]  ${page_number}
    Element Should Contain  class:result-count  ${page_number}

Select Slide
    [Arguments]  ${slide_name}
    Click Link  ${slide_name}
    Verifying Slide Name  ${slide_name}

Verifying Slide Name
    [Arguments]  ${slide_name}
    Element Should Contain  class:slideshow-header  ${slide_name}


Begin Web Test
    Open Browser  abount:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser