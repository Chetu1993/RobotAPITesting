*** Settings ***
Library    RequestsLibrary

Resource    ../Resources/common_keywords.robot
Resource    ../Resources/api_keywords.robot
Library   ../Data/json_data.py

Test Setup    common_keywords.Launch URL

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com/


*** Test Cases ***
E2EAPITesting

    common_keywords.Disable SSL Warnings

    ${headers}=    api_keywords.API Headers Information

    FOR    ${name}    ${title}    IN
    ...    chetan    software engineer
    ...    kishor    senior consultant
    ...    manoj     devops consultant

    ${body}=    api_keywords.Post Body Information    ${name}    ${title}    30    1
    ${data_driven_response}=    api_keywords.Post Method    headers=${headers}    json=${body}
    Should Be Equal As Integers    ${data_driven_response.status_code}    201
    END


    ${post_body}=    api_keywords.Post Body Information    chetan    software engineer    33    1

    ${response}=    api_keywords.Post Method    headers=${headers}    json=${post_body}


    ${json}=    Set Variable    ${response.json()}
    ${id}=    Set Variable    ${json['id']}

    Dictionary Should Contain Key    ${json}    id
    Dictionary Should Contain Key    ${json}    name

    Log To Console    ${json}

    Should Be Equal As Integers    ${response.status_code}    201

    Should Be Equal    ${json['name']}    chetan

    ${get_response}=    api_keywords.Get Method    headers=${headers}

    Should Be Equal as Integers    ${get_response.status_code}    200

    ${put_body}=    api_keywords.Put Body Information    chetan kumar    quality analyst

    ${put_response}=    api_keywords.Put Method    headers=${headers}    json=${put_body}

    ${put_json}=    Set Variable    ${put_response.json()}

    Should Be Equal    ${put_json['name']}    chetan kumar

    Should Be Equal As Integers    ${put_response.status_code}    200

    ${patch_body}=    api_keywords.Patch Body Information    chetan    automation tester

    ${patch_response}=    api_keywords.Patch Method    headers=${headers}    json=${patch_body}

    Should Be Equal As Integers    ${patch_response.status_code}    200

    ${delete_response}=    api_keywords.Delete Method    headers=${headers}

    Should Be Equal As Integers    ${delete_response.status_code}    200

    ${negative_testing_get_response}=    api_keywords.Negative Testing Get Method   headers=${headers}    expected_status=any
    Should Be Equal As Integers    ${negative_testing_get_response.status_code}    404

Post Method Using Data-Driven Test

    ${headers}=    api_keywords.API Headers Information

    ${data}=    Load Test Data    ${EXECDIR}/Data/testdata.json
    FOR    ${item}    IN    @{data}
        ${body}=    Create Post Body
        ...    ${item['name']}
        ...    ${item['title']}
        ...    30
        ...    1
        ${res}=    POST    ${base_url}/posts    headers=${headers}    json=${body}
        Should Be Equal As Integers    ${res.status_code}    201
    END














