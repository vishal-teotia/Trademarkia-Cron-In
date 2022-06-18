FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN trademarkia_cron_in create-db
RUN trademarkia_cron_in populate-db
RUN trademarkia_cron_in add-user -u admin -p admin
EXPOSE 5000
CMD ["trademarkia_cron_in", "run"]
