#!/bin/sh

# sudo service nginx start
cd /app
bundle exec rails db:seed RAILS_ENV=production
# bin/setup
# echo $DATABASE_URL
bundle exec pumactl start