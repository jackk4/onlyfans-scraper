FROM python:3.10.10-slim

ADD . /scraper

VOLUME /logs

WORKDIR /scraper

RUN chmod +x onlyfans_scraper/dist/run.sh

ENTRYPOINT ["onlyfans_scraper/dist/run.sh"]
