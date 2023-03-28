#!/bin/bash
python -m pip install --upgrade pip
python -m pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python -m onlyfans_scraper.scraper "$@"