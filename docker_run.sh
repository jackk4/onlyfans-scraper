#!/bin/bash
if ! [[ $1 =~ [0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	echo Please input a version in the format MajorVersion.MinorVersion.PatchVersion.
	exit
fi

docker rm of-scraper
docker run --name of-scraper -it -v /home/ubuntu/scraped-data:/scraper/onlyfans_scraper/runtime $DOCKER_REPO/of-scraper:$1 $2 $3 $4
