FROM python:3.10.10-slim
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ADD . /scraper

VOLUME /logs

WORKDIR /scraper

RUN python -m pip install --upgrade pip \
    pip install -r requirements.txt

RUN chmod +x onlyfans_scraper/dist/run.sh

ENTRYPOINT ["onlyfans_scraper/dist/run.sh"]
