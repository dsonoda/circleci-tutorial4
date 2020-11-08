# pull official base image
FROM python:3.8.2-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# create Django directory for the app user
ENV APP_HOME=/usr/src/app
RUN mkdir $APP_HOME && \
    mkdir $APP_HOME/staticfiles && \
    mkdir $APP_HOME/mediafiles

# create the app user
RUN addgroup -S app && adduser -S app -G app

# set work directory
WORKDIR $APP_HOME

# install dependencies
COPY ./app/Pipfile .
COPY ./app/Pipfile.lock .
RUN apk update && \
    apk add postgresql-dev gcc python3-dev musl-dev libpq && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --dev --system

# copy project
COPY ./app $APP_HOME

# chown all the files to the app user
RUN chown -R app:app $APP_HOME

# change to the app user
USER app

EXPOSE 8000
