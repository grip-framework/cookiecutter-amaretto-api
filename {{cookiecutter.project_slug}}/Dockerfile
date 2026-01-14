FROM crystallang/crystal:latest AS builder

WORKDIR /app

COPY shard.yml shard.lock ./
RUN shards install --production

COPY src/ ./src/
COPY spec/ ./spec/ 
RUN shards build --production --release --static --error-trace -Dpreview_mt && strip bin/{{cookiecutter.project_slug}}

FROM alpine:3.19

RUN apk add --no-cache \
    ca-certificates \
    tzdata \
    curl

RUN addgroup -g 1000 app && adduser -u 1000 -G app -s /bin/sh -D app

WORKDIR /app

COPY --from=builder /app/bin/{{cookiecutter.project_slug}} ./bin/{{cookiecutter.project_slug}}

RUN chown -R app:app /app

USER app

ENV CRYSTAL_ENV=production \
    PORT=8888 \
    CRYSTAL_WORKERS=8

EXPOSE 8888

CMD ["./bin/{{cookiecutter.project_slug}}", "-w", "8"]