*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/

${ENV}    qa
${QA_URL}    https://jsonplaceholder.typicode.com/
${PROD_URL}    https://dev.api.com

*** Keywords ***

Launch URL
    IF    $ENV=='qa'
    RETURN    Create Session    mysession    ${QA_URL}
    ELSE
    RETURN    Create Session    mysession    ${PROD_URL}
    END


Disable SSL Warnings
    Evaluate    __import__('urllib3').disable_warnings()





