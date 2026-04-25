*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Resource    common_keywords.robot

*** Variables ***
${id}    1
${negative_test_id}    9999
*** Keywords ***

API Headers Information
        ${headers}=    Create Dictionary

    ...    Content-Type=application/json

Post Body Information
    [Arguments]    ${name}    ${title}    ${age}    ${userId}
    ${post_body}=    Create Dictionary
    ...    name=${name}
    ...    title=${title}
    ...    age=${age}
    ...    userId=${userId}
    RETURN    ${post_body}




Put Body Information
    [Arguments]    ${name}    ${title}
    ${put_body}=    Create Dictionary
    ...    name=${name}
    ...    title=${title}
    RETURN    ${put_body}

Patch Body Information
    [Arguments]    ${name}    ${title}
    ${patch_body}=    Create Dictionary
    ...    name=${name}
    ...    title=${title}
    RETURN    ${patch_body}

Post Method
    [Arguments]    ${headers}    ${json}
    ${response}=    Post On Session    mysession    /posts    ${headers}    ${json}
    RETURN    ${response}

Get Method
    [Arguments]    ${headers}
    ${response}=    Get On Session    mysession    /posts    ${headers}
    RETURN    ${response}

Put Method
    [Arguments]    ${headers}    ${json}
    ${response}=    Put On Session    mysession    /posts/${id}    ${headers}    ${json}
    RETURN    ${response}

Patch Method
    [Arguments]    ${headers}    ${json}
    ${response}=    Patch On Session    mysession    /posts/${id}    ${headers}    ${json}
    RETURN    ${response}

Delete Method
    [Arguments]    ${headers}
    ${response}=    Delete On Session    mysession    /posts/${id}    ${headers}
    RETURN    ${response}

Negative Testing Get Method
    [Arguments]    ${headers}    ${expected_status}
    ${response}=    Get On Session    mysession    /posts/${negative_test_id}    ${headers}    ${expected_status}
    RETURN    ${response}