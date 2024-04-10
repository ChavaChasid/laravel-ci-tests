FROM php:8.2-fpm

WORKDIR /app

# --- NETFREE CERT INTSALL ---
ADD https://netfree.link/dl/unix-ca.sh /home/netfree-unix-ca.sh 
RUN cat  /home/netfree-unix-ca.sh | sh
ENV NODE_EXTRA_CA_CERTS=/etc/ca-bundle.crt
ENV REQUESTS_CA_BUNDLE=/etc/ca-bundle.crt
ENV SSL_CERT_FILE=/etc/ca-bundle.crt
# --- END NETFREE CERT INTSALL ---

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libicu-dev \
    zlib1g-dev \
    libzip-dev \
    && docker-php-ext-install pdo pdo_pgsql intl zip bcmath

RUN apt-get update \
    && apt-get install -y \
        zip \
        unzip \ 
        npm 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 2.0.0

ENV PATH "/root/.composer/vendor/bin:$PATH"

ENV COMPOSER_VERSION 2
EXPOSE 8000