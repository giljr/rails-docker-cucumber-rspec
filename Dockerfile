FROM ruby:3.4.10-bookworm

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev \
    git \
    curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler -v 2.6.9
RUN gem install rails -v 8.1.3.1

CMD ["bin/rails", "server", "-b", "0.0.0.0"]