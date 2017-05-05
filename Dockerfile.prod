# Starting locally
# docker build -t cfa/discrete -f Dockerfile.prod .
# docker run -ti -d --name discrete -p 8000:3000 -e SECRET_KEY_BASE=$(rails secret) -v $(pwd):/usr/src/app cfa/discrete
# docker run -d --name discrete -P -e SECRET_KEY_BASE=$(rails secret) -v $(pwd):/usr/src/app cfa/discrete
# docker exec -it discrete bash
# docker exec -it discrete cat log/production.log

FROM ruby:2.4-alpine

ENV PATH /root/.yarn/bin:$PATH

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh build-base nodejs tzdata

RUN apk update \
  && apk add curl bash binutils tar gnupg \
  && rm -rf /var/cache/apk/* \
  && /bin/bash \
  && touch ~/.bashrc \
  && curl -o- -L https://yarnpkg.com/install.sh | bash \
  && apk del curl tar binutils

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
WORKDIR /usr/src/app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

COPY package.json yarn.lock ./
RUN yarn install
RUN npm rebuild node-sass --force

# Set Rails to run in production
ENV RAILS_ENV production 
ENV RACK_ENV production
ENV RAILS_ROOT /usr/src/app
# Use Rails for static files in public
ENV RAILS_SERVE_STATIC_FILES 1
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE $SECRET_KEY_BASE

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN bundle exec rake assets:precompile

EXPOSE 3000
# Start puma
CMD bundle exec puma -C config/puma.rb