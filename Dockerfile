FROM python:3.8.1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
RUN pip install psycopg2-binary

COPY postgresql.conf      /tmp/postgresql.conf

RUN pip install --upgrade pip
RUN pip install psycopg2-binary

# COPY base.py base.py

CMD ["python", "base.py"]