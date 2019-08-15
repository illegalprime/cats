FROM python:3.7.4-alpine3.10

RUN pip install flask

ENV FLASK_APP "/src/api.py"

ADD . /src

CMD ["flask", "run", "--host=0.0.0.0"]
