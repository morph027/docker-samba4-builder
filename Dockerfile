FROM debian:jessie

MAINTAINER morph027 "morphsen@gmx.com"

RUN	apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y -qq install \
	acl \
	attr \
	autoconf \
	bison \
	build-essential \
	curl \
	debhelper \
	dnsutils \
	docbook-xml \
	docbook-xsl \
	flex \
	gdb \
	krb5-user \
	libacl1-dev \
	libaio-dev \
	libattr1-dev \
	libblkid-dev \
	libbsd-dev \
	libcap-dev \
	libcups2-dev \
	libgnutls28-dev \
	libjson-perl \
	libldap2-dev \
	libncurses5-dev \
	libpam0g-dev \
	libpopt-dev \
	libreadline-dev \
	lsb-release \
	perl \
	perl-modules \
	pkg-config \
	python-all-dev \
	python-dev \
	python-dnspython \
	python-crypto \
	rpm \
	ruby \
	ruby-dev \
	xsltproc \
	zip \
	zlib1g-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN	gem install fpm --no-rdoc --no-ri

RUN	curl -s -o /tmp/aptly_cli.gem http://download.morph027.de/aptly_cli-0.2.1.gem \
	&& gem install commander httmultiparty --no-ri --no-rdoc \
	&& gem install --local /tmp/aptly_cli.gem \
	&& rm -f /tmp/aptly_cli.gem
