#!/bin/bash
source .venv/bin/activate
set -a
source resources/.env
set +a
robot tests/pizza_order.robot 