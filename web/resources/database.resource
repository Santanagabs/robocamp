*** Settings ***
Documentation        Gerenciando a massa de testes através do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2    
    ...                    imkkjfyj    
    ...                    imkkjfyj
    ...                    br2WRQ6GhvtVi1ltQ7elyDa4arjvLWKe 
    ...                    silly.db.elephantsql.com 
    ...                    5432

Select Student Where Email
    [Arguments]        ${email}

    ${query}            Set Variable
    ...                 SELECT * FROM public.students WHERE email = '${email}';
    
    ${result}           Query                ${query}

    RETURN            ${result}[0]

Delete Enroll By Email
    [Arguments]        ${email}
    
    ${user}            Select Student Where Email            ${email}

    ${query}        Set Variable
    ...             DELETE FROM public.enrollments WHERE student_id = '${user}[0]';
    
    Execute SQL String        ${query}


Delete Student By email
    [Arguments]               ${email}

    ${query}            Set Variable 
    ...                 DELETE FROM public.students WHERE email = '${email}';
    
    Execute Sql String    ${query}


# Helpers
Reset Student 
    [Arguments]               ${email}
    Connect To Postgres
    Delete Student By email    ${email}     
    Disconnect From Database

