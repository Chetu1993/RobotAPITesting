*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Keywords ***

Disable SSL Warnings
    Evaluate    __import__('urllib3').disable_warnings()

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Delete Request TC

    Disable SSL Warnings

    Create Session    mysession    ${BASE_URL}
    ${headers}=    Create Dictionary
    ...    Content-Type=Application/Json




    ${response}=    Delete On Session    mysession    /posts/1    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200
