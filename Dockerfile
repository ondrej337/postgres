FROM ghcr.io/cloudnative-pg/postgresql:16.4-4-bookworm
USER root
WORKDIR /myapp
COPY requirements.txt requirements.txt
RUN set -xe; \
    pip3 install --break-system-packages --no-deps -r requirements.txt; \
    apt-get update && apt-get install -y postgresql-plpython3-16;
USER 26