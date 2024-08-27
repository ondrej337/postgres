FROM ghcr.io/cloudnative-pg/postgresql:16.4-4-bookworm
USER root

RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		"postgresql-plpython3-16" ; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;
USER 26
