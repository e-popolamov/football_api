FROM ruby:3.1.4
ENV BUNDLER_VERSION=2.4.20
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler -v 2.4.20

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle check || bundle install

COPY . /myapp/

COPY bin/docker-entrypoint /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3001

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
