# This file intended to be sourced

# . /build/config-build-env.sh

# Prevent initramfs updates from trying to run grub and lilo.
export INITRD=no
export DEBIAN_FRONTEND=noninteractive

MINIMAL_APT_GET_ARGS='-y --no-install-recommends'

# File containing original installed packages
PACKAGES_INSTALLED_LOG="/tmp/packages.lst"

# Initial Setup Packages.
SETUP_PACKAGES="ca-certificates cron tzdata pkg-config git curl wget"

## Run time dependencies ##
RUN_PACKAGES="ca-certificates cron tzdata pkg-config git curl wget openssl mariadb-client libgssapi-krb5-2 libkrb5-3 libexpat1 libxml2 libargon2-1 libenchant-2-2 libpng16-16 libwebp6 libjpeg62-turbo libxpm4 libfreetype6 libonig5 libsodium23 libxslt1.1 libzip4 libzstd1 liblz4-1 libcurl4 imagemagick libc-client2007e libmemcached11 libdbd-freetds freetds-bin procps libatomic1 net-tools less libjpeg-turbo-progs optipng gifsicle zip unzip libyajl2 libpcre2-posix2 libpcre++0v5 liblmdb0 libgeoip1 ruby-full gnupg2 nodejs yarn mmdb-bin lua-mmdb brotli libbrotli1 liblua5.2-0 lua5.2 ssdeep libldap-2.4-2 libldap-common libssh2-1 libsasl2-2 libsasl2-modules libsasl2-modules-db libnghttp2-14 libpsl5 librtmp1 publicsuffix"

## Build time dependencies ##

# Core list from docs
BUILD_PACKAGES="build-essential"

# OLS build required packages
BUILD_PACKAGES="$BUILD_PACKAGES cmake g++ autoconf automake libtool flex bison gdb libgeoip-dev liblmdb-dev libyajl-dev libpcre++-dev libmaxminddb-dev liblualib50-dev liblua50-dev libudns-dev libbrotli-dev libssl-dev zlib1g-dev liblua5.2-dev libcurl4-openssl-dev libexpat1-dev libcurlpp-dev libcurlpp0 libidn11-dev libkrb5-dev libldap2-dev librtmp-dev libssh2-1-dev"

# PHP building required packages
BUILD_PACKAGES="$BUILD_PACKAGES libdb5.3-dev krb5-multidev re2c libxml2-dev libbz2-dev libjpeg-dev libfreetype6-dev libgmp3-dev libpng-dev libxpm-dev libc-client2007e-dev libenchant-2-dev libsasl2-dev libc-client2007e-dev libldb-dev libmcrypt-dev libmhash-dev freetds-dev zlib1g-dev libpq-dev libmariadb-dev-compat libmariadb-dev libncurses5-dev libpcre2-dev libpcre3-dev unixodbc-dev libsqlite3-dev libaspell-dev libreadline6-dev librecode-dev libsnmp-dev libtidy-dev libxslt-dev libonig-dev libzip-dev libwebp-dev freetds-dev libpspell-dev libedit-dev libsodium-dev libargon2-dev libvarnishapi-dev libmagickwand-dev libmagickcore-dev libmemcached-dev libzstd-dev liblz4-dev libyaml-dev libffi-dev"

# apt-get remove --allow-remove-essential enters an infinite loop of
# pam errors with this package
#  login: because it depends on libpam*
PACKAGES_REMOVE_SKIP_REGEX='(libpam|login)'

# Setup OpenLiteSpeed home directory.
LSWS_HOME=/usr/local/lsws
