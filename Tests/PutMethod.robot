*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
*** Keywords ***

Disable SSL Warning
    Evaluate    __import__('urllib3').disable_warnings()
*** Variables ***

${base_url}    https://jsonplaceholder.typicode.com/

*** Test Cases ***
PutMethodTest
    Disable SSL Warning
    Create Session    mysession    ${base_url}

    ${headers}=    Create Dictionary
    ...    Content-Type=Application/Json

    ${body}=    Create Dictionary
    ...    id=1
    ...    name=Chetan
    ...    city=Bangalore
    ...    userId=1

    ${response}=    Put On Session    mysession    /posts/1    headers=${headers}    json=${body}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${json}

    Should Be Equal    ${json['name']}    Chetan
    Should Be Equal    ${json['city']}    Bangalore