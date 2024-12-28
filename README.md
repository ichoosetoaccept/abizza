# Pizza Buona Automation

A Robot Framework automation script for ordering pizza from pizzabuona.ch. The script automates everything up to the final confirmation, allowing for manual review before placing the order.

## Features

- Automatically fills in delivery location
- Orders a Pizza Contadina with two extra toppings
- Orders a Calzone Bomba
- Fills in all delivery details
- Selects cash payment method
- Stops at final confirmation for manual review

## Prerequisites

- Python 3.x
- Robot Framework
- Browser Library for Robot Framework

## Installation

1. Create a virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install robotframework robotframework-browser
```

3. Initialize the Browser library:
```bash
rfbrowser init
```

## Configuration

1. Copy the environment template to create your .env file:
```bash
cp .env.template .env
```

2. Edit `.env` with your delivery details:
```env
POSTCODE=1234
CUSTOMER_FIRST_NAME=John
CUSTOMER_LAST_NAME=Doe
STREET_AND_NUMBER=Example Street 123
PHONE=+41123456789
EMAIL=example@email.com
DELIVERY_INFO=1st Floor
```

## Usage

Run the automation:
```bash
robot pizza_order.robot
```

The script will:
1. Open Chrome
2. Navigate through the ordering process
3. Fill in all details
4. Stop at the final confirmation
5. Keep the browser open for manual review (for 1 hour or until Ctrl+C)

## Safety Features

- The final order confirmation button is intentionally commented out to prevent accidental orders
- Manual review is required before completing the order
- Browser stays open for verification before actual order placement
- Personal information is stored in `.env` file (not committed to git)
