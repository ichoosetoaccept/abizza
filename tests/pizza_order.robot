*** Settings ***
Documentation     RPA script to order pizza from pizzabuona.ch
...               This is a business process automation, not a test.
Library    Browser
Library    OperatingSystem
Resource    ../src/keywords/pizza_keywords.resource

*** Variables ***
${POSTCODE}         %{POSTCODE}
${CUSTOMER_FIRST_NAME}    %{CUSTOMER_FIRST_NAME}
${CUSTOMER_LAST_NAME}    %{CUSTOMER_LAST_NAME}
${STREET_AND_NUMBER}    %{STREET_AND_NUMBER}
${PHONE}    %{PHONE}
${EMAIL}    %{EMAIL}
${DELIVERY_INFO}    %{DELIVERY_INFO}

*** Tasks ***
Order Pizza From La Pizza Buona
    [Documentation]    Places a pizza order for delivery
    TRY
        Open Pizza Website
        Select Delivery Location    ${POSTCODE}
        Select Pizza Contadina
        Select Calzone Bomba
        Fill out delivery details    ${CUSTOMER_FIRST_NAME}    ${CUSTOMER_LAST_NAME}    ${STREET_AND_NUMBER}    ${EMAIL}    ${PHONE}    ${DELIVERY_INFO}
        Complete order
    EXCEPT    AS    ${error}
        Log    Failed to order pizza: ${error}    level=ERROR
        Take Screenshot    filename=error-screenshot-${error}
    END 