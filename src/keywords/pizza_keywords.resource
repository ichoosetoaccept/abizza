*** Settings ***
Library    Browser
Library    BuiltIn

*** Keywords ***
Open Pizza Website
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    Set Browser Timeout    timeout=20s
    New Page    https://pizzabuona.ch
    
Select Delivery Location
    [Arguments]    ${postcode}
    Fill Text    id=plz    ${postcode}    
    Press Keys    id=plz    Enter
    Wait For Elements State    text="Pizza Contadina"    visible

Select Pizza Contadina
    Log    Clicking the add button...
    Click    css=#item6808 table .btn
    
    Log    Selecting additional ingredients...
    Click    css=#toopen6808 > div:nth-child(1) > div > div:nth-child(12) > div > label > input
    Click    css=#toopen6808 > div:nth-child(1) > div > div:nth-child(18) > div > label > input
    
    Log    Clicking confirmation button...
    Click    css=#toopen6808 > div.row > div.col-md-4 > a > div

Select Calzone Bomba
    Log    Clicking the add button...
    Click    css=#item6576 .btn
    
    Log    Going to cart...
    Click    css=.buy > .btn
    Wait For Elements State    css=.cartrow    visible

Fill out delivery details
    [Arguments]    ${customer_first_name}    ${customer_last_name}    ${street_and_number}    ${email}    ${phone}    ${info}
    
    Log    Filling in customer first name...
    Fill Text    css=.col-md-6:nth-child(1) .form-control    ${customer_first_name}
    
    Log    Filling in customer last name...
    Fill Text    css=.col-md-6:nth-child(2) .form-control    ${customer_last_name}
    
    Log    Filling in street and number...
    Fill Text    css=.col-md-12:nth-child(3) .form-control    ${street_and_number}
    
    Log    Filling in email address...
    Fill Text    css=.col-md-6:nth-child(6) .form-control    ${email}
    
    Log    Filling in phone number...
    Fill Text    css=.col-md-6:nth-child(7) .form-control    ${phone}
    
    Log    Filling in additional info...
    Fill Text    css=.col-md-12:nth-child(8) .form-control    ${info}
    
    Log    Proceeding to payment page...
    Click    css=.btn-buy
    Sleep    2s
    
    Log    Selecting payment method...
    Click    css=label:nth-child(6) > .labelauty-unchecked

Complete order
    Log    Ready for manual review and order completion...
    # DANGER: This would place a real order! Left commented out for safety.
    # The browser will stay open for manual review and order completion.
    # Click    css=.btn-buy
    
    Log    Browser will stay open for 1 hour for manual review. Press Ctrl+C to close...
    Sleep    60
