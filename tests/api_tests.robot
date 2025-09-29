*** Settings ***
Documentation    API Testing for Simple API
Library          RequestsLibrary
Library          Collections

*** Variables ***
${BASE_URL}      http://localhost:5002
${TIMEOUT}       10

*** Test Cases ***
true_when_x_is_17
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is_prime/17
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.text}    true

false_when_x_is_36
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is_prime/36
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.text}    false

true_when_x_is_13219
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /is_prime/13219
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.text}    true
