*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource
Library    SeleniumLibrary


*** Test Cases ***
Deve matricular um aluno

    # Falcao
    # Smart
    # 30/06/2022

    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy

    Do Login    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student     Falcão
    Select Plan        Smart
    Sleep    5
    Fill Start Date

    Sleep      10