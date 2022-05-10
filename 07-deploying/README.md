# Deploying

## Lecture Objectives
- [ ] Understand what "deploying" means
- [ ] Deploy to Heroku
- [ ] Seed and Migrate on Heroku
- [ ] Push updates to Heroku

### Heroku 
Heroku is a Platform as a Service (PaaS). It manages the hardware and environment we can use to host our application. Instead of hosting our apps locally, we can use Heroku's service to host our apps on the web.

### Download Heroku 

```
 brew tap heroku/brew && brew install heroku

 # Using the terminal log into heroku 
  heroku login

```
Heroku only supports specific versions of ruby. Of the versions it supports we recommend 2.7.4

```
 rvm install 2.7.4 --default
 gem install bundler
 gem install rails

```

Heroku requires Postgresql instead of SQLite

```
brew install postgresql

brew services start postgresql


```

### Hosting a Rails App

To deploy a Rails / React app, we need to make sure the app is using PostgreSQL. 

```
 rails new flatiron-theater --api --minimal --database=postgresql

# This will configure our gemfile.lock to work with the same OS Heroku uses 
 bundle lock --add-platform x86_64-linux --add-platform ruby

#Build the app as normal 
```

### Hosting a React App


To host our React app in the same domain as our Rails app, we will need to configure React to work in Rails production environment.

```
 npm install --prefix client

# Create a Procfile in the root of your directory with the following:

web: bundle exec rails s
release: bin/rake db:migrate

# To allow your app to be run locally using Heroku, create a Procfile.dev in the root of your directory as well with the following:

web: PORT=4000 npm start --prefix client
api: PORT=3000 bundle exec rails s


 # Create a static React APP that is being served from Rails
 npm run build --prefix client

 # Move the static files to public which is used by rails to serve static assets 
  mv client/build/* public

# Configure client side routing
# Because we use client side routing, we need to make sure the routes from our React app still load our components by redirecting client routes to our index.html 

# routes.rb
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

# terminal 
  rails g controller fallback_controller

# app/controllers/fallback_controller.rb
class FallbackController < ActionController::Base
  def index
    render file: 'public/index.html'
  end
end


```

## Deploy to Heroku 

``` 
# Add a package.json to the root of your Rails app with the following:
```

```
{
    "name": "heroku-deploy",
    "description": "Build scripts for Heroku",
    "engines": {
      "node": "15.6.0"
    },
    "scripts": {
      "clean": "rm -rf public",
      "build": "npm install --prefix client && npm run build --prefix client",
      "deploy": "cp -a client/build/. public/",
      "heroku-postbuild": "npm run clean && npm run build && npm run deploy"
    }
  }
```


```
heroku create

git add .
git commit -m 'Initial commit'

heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2

git push heroku main

# seed and migrate
heroku run rails db:migrate db:seed

#open your heroku app 
heroku open

# See the url that your app is being hosted at
git config --list --local | grep heroku

# run heroku locally
 heroku local -f Procfile.dev

```


