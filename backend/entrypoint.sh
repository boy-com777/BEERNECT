#!/bin/sh

# sudo service nginx start
cd /app
bin/setup
echo $DATABASE_URL
bundle exec pumactl start