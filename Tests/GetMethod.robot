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

MethodGetTestCase
    Disable SSL Warning
    Create Session    mysession    ${base_url}    verify=False
    ${response}=    Get On Session    mysession    /users/1

    Log    ${response.status_code}
    Log    ${response.json()}

    Should Be Equal As Integers    ${response.status_code}    200




*** Keywords ***