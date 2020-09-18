FROM ruby:2.3-slim
# Install dependecies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential nodejs libpq-dev
# set path
ENV INSTALL_PATH /usr/src/app
# Create folder
RUN mkdir -p $INSTALL_PATH
# Set path as root path
WORKDIR $INSTALL_PATH
# Copy gemfile into the container
COPY Gemfile ./
# Install gems
RUN bundle install
# Copy the code into the container
COPY . .
# Run the server
CMD ["rails", "server", "-b", "0.0.0.0"]
