FROM ruby:2.7.1

# add nodejs and yarn dependencies for the frontend
ENV NODE_VERSION 12

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

ENV PATH_PROJECT /NAME_RAILS_PROJECT

# Cria diretório
RUN mkdir /$PATH_PROJECT
WORKDIR /$PATH_PROJECT
COPY $PATH_PROJECT/Gemfile /$PATH_PROJECT/Gemfile
COPY $PATH_PROJECT/Gemfile.lock /$PATH_PROJECT/Gemfile.lock
RUN bundle install
COPY $PATH_PROJECT /$PATH_PROJECT
EXPOSE 3000
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]