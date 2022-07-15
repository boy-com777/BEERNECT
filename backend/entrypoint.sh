#!/bin/sh

# sudo service nginx start
cd /app
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop
# bundle exec rails db:seed RAILS_ENV=production
bin/setup
# echo $DATABASE_URL
bundle exec pumactl start