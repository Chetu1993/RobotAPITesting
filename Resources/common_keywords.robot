*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/


*** Keywords ***

Launch URL
    Create Session    mysession    ${base_url}

Disable SSL Warnings
    Evaluate    __import__('urllib3').disable_warnings()





