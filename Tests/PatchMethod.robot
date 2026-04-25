*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

*** Keywords ***
Disable SSL Warnings
    Evaluate    __import__('urllib3').disable_warnings()


*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com/

*** Test Cases ***
PATCH method TC
    Disable SSL Warnings
    Create Session    mysession    ${base_url}
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ${body}=    Create Dictionary
    ...    name=chetan
    ...    age=33
    ...    city=Bangalore
    ...    userId=1

    ${response}=    Patch On Session    mysession    /posts/1    headers=${headers}    json=${body}

    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${json}
    Log To Console    ${json['name']}
    Should Be Equal    ${json['name']}    chetan
