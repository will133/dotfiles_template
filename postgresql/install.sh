#!/bin/bash

# See https://wiki.postgresql.org/wiki/Apt
# Add postgresql repo to system
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

# postgresql-client-16 	client libraries and client binaries
# postgresql-16 	core database server
# postgresql-doc-16 	documentation
# libpq-dev 	libraries and headers for C language frontend development
# postgresql-server-dev-16
sudo apt install postgresql-16 postgresql-client-16

# Add user to database, for more commands check:
# https://stackoverflow.com/questions/2172569/how-to-login-and-authenticate-to-postgresql-after-a-fresh-install
sudo -u postgres createuser -s $USER

# Can also do this in order to
# create user test_write with password '<your_password>'
# create user test_read with password '<your_password>'
# grant all priviledges on $DB_NAME to test_write
# grant create on schema public to test_write;
