*** Settings ***
Documentation        Consumindo a rota services da API REST

Library            RequestsLibrary
Resource    ../base.resource

*** Keywords ***
Get Service Token
    [Arguments]            ${user}
    
    
    ${response}    POST             http://localhost:3333/sessions
    ...              json=${user}
    ...              expected_status=200
    
    ${token}    Set Variable          Bearer ${response.json()}[token]

    RETURN      ${token}