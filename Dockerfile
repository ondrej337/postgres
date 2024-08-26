FROM ghcr.io/cloudnative-pg/postgresql:16.4-4-bookworm
USER root
COPY requirements.txt /
RUN set -xe; \
	pip3 install --break-system-packages --no-deps -r requirements.txt;
USER 26