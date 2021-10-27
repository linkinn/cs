FROM ruby:3-alpine

ENV RAILS_ENV=production

WORKDIR /app

RUN apk add --no-cache build-base tzdata nodejs yarn sqlite-dev postgresql-dev mysql-dev

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install
RUN bundle exec rails webpacker:install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]