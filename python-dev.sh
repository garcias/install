#! /bin/bash

sudo apt-get install python-virtualenv python-dev libffi-dev
virtualenv venv
source venv/bin/activate
pip install --upgrade pip
pip install requests[security]
