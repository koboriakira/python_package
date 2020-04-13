FROM python:3.7.5-slim

WORKDIR /work

ADD koboripackage koboripackage
ADD tests tests
ADD requirements.txt requirements.txt
ADD setup.py setup.py
ADD MANIFEST.in MANIFEST.in

RUN pip install --upgrade pip \
  && pip install -r requirements.txt \
  && pip install pytest

CMD bash
