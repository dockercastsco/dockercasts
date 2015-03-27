FROM ruby:latest

COPY . /app
WORKDIR /app

RUN bundle install

EXPOSE 4000
CMD ["bundle", "exec", "jekyll", "serve"]
