# Docker for Silver Stripe
A Docker container for Apache+PHP that supports Silverstripe.
https://hub.docker.com/r/evanshunt/php-for-ss

## SSL

Apache serves the same html directory to both 80 (non-SSL) and 443 (SSL) using
the default certs supplied by Debian.

The certs must be replaced with valid certs for production.
