FROM ghcr.io/cloudnative-pg/postgresql:16.4-4-bookworm
USER root

COPY requirements.txt /tmp
RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		"postgresql-plpython3-16" ; \
	pip3 install --break-system-packages --no-deps -r /tmp/requirements.txt; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;
USER 26
