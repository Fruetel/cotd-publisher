FROM ruby:2.7.1-slim

RUN apt-get update && \
  apt-get install --no-install-recommends -y git build-essential postgresql-client wget && rm -rf /var/lib/apt/lists/*

RUN groupadd -r app -g 1000
RUN useradd -u 1000 -r -g app -m -s /sbin/nologin app

WORKDIR /code

COPY Gemfile /code
COPY Gemfile.lock /code
RUN chown -R app:app /code/

USER app
RUN gem install bundler
RUN bundle install
USER root
RUN apt-get purge -y --auto-remove build-essential
USER app

COPY . /code

USER root
RUN chown -R app:app /code/
USER app

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["run"]
