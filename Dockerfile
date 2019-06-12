FROM ruby:2.6.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

RUN bundle exec rake assets:precompile

CMD ["bundle", "exec", "rackup", "--port=8080", "--host=0.0.0.0"]
