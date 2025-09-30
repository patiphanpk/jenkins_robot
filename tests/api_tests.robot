*** Settings ***
Documentation    API Testing for Simple API
Library          RequestsLibrary
Library          Collections

*** Variables ***
${BASE_URL}      http://localhost:5002
${TIMEOUT}       10

*** Test Cases ***

false_when_x_is_3dot7
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2honor/3.7
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal    ${json}[output]    false

true_when_x_is_3dot4
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2honor/3.4
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal    ${json}[output]    true

false_when_x_is_3dot1
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is2honor/3.1
    Should Be Equal As Strings    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal    ${json}[output]    false
