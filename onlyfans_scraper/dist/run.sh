#!/bin/bash
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m onlyfans_scraper.scraper "$@"