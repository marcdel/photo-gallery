# Photo Gallery Application

Create your real app config which is in .gitignore
	cp config/application.demo.yml config/application.yml

Push values to Heroku with
	rake figaro:heroku

Or
	heroku config:add AWS_BUCKET=bucket
	heroku config:add AWS_ACCESS_KEY_ID=access_key
	heroku config:add AWS_SECRET_ACCESS_KEY=secret_key