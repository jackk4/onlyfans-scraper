FROM python:3.10.10-slim

ADD . /scraper

VOLUME /logs

WORKDIR /scraper

ENTRYPOINT ["tail", "-f", "/dev/null"]

# ENTRYPOINT ["onlyfans_scraper/dist/run.sh"]
# CMD ["-a"]