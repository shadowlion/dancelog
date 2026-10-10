FROM alpine:latest AS downloader

ARG PB_VERSION=0.40.5
ARG TARGETOS
ARG TARGETARCH

ENV BUILDX_ARCH="${TARGETOS:-linux}_${TARGETARCH:-amd64}"

# Install the dependencies
RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_${BUILDX_ARCH}.zip \
    && unzip pocketbase_${PB_VERSION}_${BUILDX_ARCH}.zip \
    && chmod +x /pocketbase

FROM scratch

EXPOSE 8090

COPY --from=downloader /pocketbase /usr/local/bin/pocketbase
COPY ./pb_migrations /pb_migrations

CMD ["/usr/local/bin/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data", "--migrationsDir=/pb_migrations"]
