# Abbizzeli

A Robot Framework automation script for ordering pizza from pizzabuona.ch. The script automates everything up to the final confirmation, allowing for manual review before placing the order.

> **Note**: This project currently has the author's favorite order hard-coded (Pizza Contadina with extra toppings and Calzone Bomba). While you can use this as a template for your own pizza ordering automation, you'll need to modify the selectors and order details in `src/keywords/pizza_keywords.resource` to match your preferred pizzas.

## Features

- Automatically fills in delivery location
- Orders a Pizza Contadina with two extra toppings
- Orders a Calzone Bomba
- Fills in all delivery details
- Selects on-site credit card payment method
- Stops at final confirmation for manual review

## Project Structure

```
.
├── src/
│   └── keywords/
│       └── pizza_keywords.resource    # Robot Framework keywords for pizza ordering
├── tests/
│   └── pizza_order.robot             # Main test suite
├── resources/
│   ├── .env                          # Your personal delivery details (not committed)
│   └── .env.template                 # Template for delivery details
├── .python-version                   # Python version for the project
├── pyproject.toml                    # Project metadata and dependencies
├── uv.lock                          # Locked dependencies for reproducible installs
├── run.sh                            # Script to run the automation
└── README.md                         # This file
```

## Prerequisites

- Python 3.x
- Robot Framework
- Browser Library for Robot Framework

## Installation

We recommend using [uv](https://docs.astral.sh/uv/) for faster and more reliable package management, but you can also use vanilla Python.

### Option 1: Using uv (Recommended)

1. Install uv ([see installation docs](https://docs.astral.sh/uv/installation/)):
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. Initialize the project and install dependencies:
```bash
uv sync  # This will create venv and install dependencies from pyproject.toml
source .venv/bin/activate
```

### Option 2: Using vanilla Python

1. Create a virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install robotframework robotframework-browser
```

### Final Step (Both Methods)

Initialize the Browser library:
```bash
rfbrowser init
```

## Configuration

1. Copy the environment template to create your .env file:
```bash
cp resources/.env.template resources/.env
```

2. Edit `resources/.env` with your delivery details:
```env
POSTCODE="1234"
CUSTOMER_FIRST_NAME="John"
CUSTOMER_LAST_NAME="Doe"
STREET_AND_NUMBER="Example Street 123"
PHONE="+41123456789"
EMAIL="example@email.com"
DELIVERY_INFO="1st Floor" (optional)
```

## Usage

Run the automation:
```bash
./run.sh
```

The script will:
1. Open Chrome
2. Navigate through the ordering process
3. Fill in all details
4. Stop at the final confirmation
5. Keep the browser open for manual review (for 60 seconds or until Ctrl+C)

## Development

To add new dependencies:
```bash
uv add <package-name>  # This will update pyproject.toml and uv.lock
```

To upgrade dependencies:
```bash
uv lock --upgrade-package <package-name>
```

## Safety Features

- The final order confirmation button is intentionally commented out to prevent accidental orders
- Manual review is required before completing the order
- Browser stays open for verification before actual order placement
- Personal information is stored in `resources/.env` file (not committed to git)
