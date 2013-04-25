# Photo Gallery Application

### Create your real app config which is in .gitignore

	cp config/application.demo.yml config/application.yml

### Push values to Heroku with

	rake figaro:heroku

### Or

	heroku config:add AWS_BUCKET=bucket
	heroku config:add AWS_ACCESS_KEY_ID=access_key
	heroku config:add AWS_SECRET_ACCESS_KEY=secret_key

### Create sample data

    bundle exec rake db:reset && bundle exec rake db:populate && bundle exec rake db:test:prepare

### Paypal Integration Guide

	https://cms.paypal.com/cms_content/en_US/files/developer/PP_OrderMgmt_IntegrationGuide.pdf