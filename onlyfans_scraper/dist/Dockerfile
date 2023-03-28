FROM python:3.10.10-slim

ADD . /scraper

VOLUME /logs

WORKDIR /scraper/onlyfans_scraper

# Install and activate virtual environment
RUN python -m pip install --upgrade pip && \
    python -m pip install virtualenv && \
    virtualenv venv && \
    source venv/bin/activate && \
    pip install -r requirements.txt

RUN chmod +x dist/run.sh

ENTRYPOINT ["dist/run.sh"]
