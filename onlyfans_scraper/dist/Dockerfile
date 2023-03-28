FROM python:3.10.10-slim

ADD . /scraper

VOLUME /logs

WORKDIR /scraper

ENTRYPOINT ["onlyfans_scraper/dist/run.sh"]
