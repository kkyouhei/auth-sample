FROM ruby:2.4.1
RUN apt-get update && \
    apt-get install -y mysql-client build-essential libpq-dev --no-install-recommends
RUN apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get -y install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && apt-get install nodejs
RUN mkdir /workdir
WORKDIR /workdir
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock
RUN bundle install
ADD . /workdir