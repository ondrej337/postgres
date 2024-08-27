ARG PG_MAJOR=16
ARG PG_MINOR=4-4
ARG DEBIANV=bookworm
FROM ghcr.io/cloudnative-pg/postgresql:$PG_MAJOR.$PG_MINOR-$DEBIANV
USER root

COPY requirements.txt /tmp
RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		"postgresql-plpython3-$PG_MAJOR" ; \
	pip3 install --break-system-packages --no-deps -r /tmp/requirements.txt; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;
USER 26
