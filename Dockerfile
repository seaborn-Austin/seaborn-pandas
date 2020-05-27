FROM ubuntu as base
RUN apt-get update && \
    apt-get install -y bundler && \
    gem install rake && \ 
    mkdir /build

FROM base as builder
WORKDIR /build
COPY ./ ./
RUN bundle install && \
    bundle exec jekyll build --trace && \
    jekyll build

FROM nginx:stable-alpine
COPY --from=builder /build/_site /usr/share/nginx/html
EXPOSE 80
