*** Settings ***
Documentation        keywords que representam a página de cadastro de matrículas

Library        Browser
Library        libs/DateTricks.py
Library        String


*** Keywords ***
Go To Enrolls
    Click     css=a[href="/matriculas"]

Go To Enroll Form 
    Click      css=a[href="/matriculas/new"] 

Select Student
    [Arguments]       ${student_name}
    Fill Text    xpath=//div[contains(text(), "nome do aluno")]/..//input    
    ...           ${student_name}

    Click       css=div[class$=option] >> text= ${student_name}

Select Plan
     [Arguments]        ${plan_name}
      #Click      css=div >> text=Selecione (Funciona, mas a melhor forma é como está abaixo:)

    Click       xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]

    Click       css=div[class$=option] >> text=${plan_name}

Fill Start Date

    Focus     css=input[name=start_date]

    ${start_date}    Get Start Date
    
    FOR    ${number}    IN        @{start_date}
        Keyboard Key    press     ${number}
    END

Submit Enroll Form
    Click    css=button >> text=Salvar

  
