# pull official base image
FROM python:3.11.4-slim-buster

# set work directory
WORKDIR /usr/src/app/backend

# install system dependencies
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
COPY ./backend/entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/backend/entrypoint.sh
RUN chmod +x /usr/src/app/backend/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/backend/entrypoint.sh"]