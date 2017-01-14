#!/bin/bash

set -e

# Check for provisioning readiness
if [ ! -e "/.chef-cooked" ]; then
  echo "Uncooked VM, skipping $0..."
  exit 0
fi

# Declare script variables
docroot="/var/www/blim/current"
configfile="${docroot}/app/config/local.php.dist"

provision_env() {
  if [ -e "${configfile}" ]; then
    echo "+ Copying configuration file"
    cp -f "${configfile}" "${docroot}/app/config/local.php"
  fi
  if [ -h "${docroot}/vendor/blim/utils" ]; then
    echo "+ Removing application symlinks"
    rm -f "${docroot}/vendor/blim/utils"
  fi
  if [ -e "${docroot}/composer.json" ]; then
    echo "+ Installing Composer dependencies"
    composer install --no-ansi --no-interaction --no-scripts --prefer-dist --working-dir $docroot
  fi
}

# Run provisioning steps
cd $docroot;

echo "Provisioning Environment"
provision_env

exit 0
