*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem


*** Keywords ***

Diable SSL Warning
    Evaluate    __import__('urllib3').disable_warnings()

*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com/
*** Test Cases ***
PostMethodTest

    Diable SSL Warning
    Create Session    mysession    ${base_url}
    ${headers}=    Create Dictionary
    ...    Content-Type=Application/Json

    ${body}=    Create Dictionary
    ...    name=chetan
    ...    age=33
    ...    city=Bellary
    ...    userId=1

    ${response}=    Post On Session    mysession    /posts    headers=${headers}    json=${body}

    Should Be Equal As Integers    ${response.status_code}    201

    log to console    ${response.json()}
    Should Be Equal    ${response.json()['userId']}    1
    Should Be Equal    ${response.json()['name']}    chetan

