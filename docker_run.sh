#!/bin/sh

docker run --name of-scraper -it -v /home/ubuntu/scraped-data:/scraper/onlyfans_scraper/runtime $DOCKER_REPO/of-scraper:0.0.4
