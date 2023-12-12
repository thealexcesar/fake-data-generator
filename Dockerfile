FROM ruby:3.2.2

WORKDIR /app

COPY . /app

RUN ls /app

RUN gem install faker clipboard

CMD ["ruby", "src/app.rb"]
