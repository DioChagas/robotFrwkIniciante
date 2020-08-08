*** Settings ***
Documentation   Aqui estará a base do projeto

Library     SeleniumLibrary

Resource                  kws.robot

*** Variables ***
${base_url}     http://automationpractice.com/index.php

*** Keywords ***
##Hooks
Open Session
    Open Browser    about:blank     chrome

Close Session
    Capture Page Screenshot
    Close Browser