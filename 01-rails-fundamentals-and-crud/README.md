# Rails Fundamentals and CRUD

## Lecture Objectives

- ✅ Explain "Convention Over Configuration" and why it’s important in Rails 
- ✅ Explain MVC and how it relates to Rails 
- ✅ Use Rails generators to create new migrations
- ✅ Add controller actions and routes for new API endpoints (production_roles, tickets, users)

## The Deliverables 
We've been hired by the Flatiron Theater Company to re-design its official website. The website should have a React front end and a Rails back end. 

- Models (Resources)
  - `Performance`
  - `ProductionRole`  
  - `Tickets`
  - `User`

![domain.png](assets/domain.png)

### "Convention Over Configuration"

- Rails makes the assumption that we'll follow specific programming conventions. Following these conventions removes the need for redundant configurations that would be similar if not the same in every Rails application. 

- "Convention Over Configuration" allows developers to code more efficiently so that they can focus on the features that make their applications unique. It also lowers the barrier of entry for Rails newbies!

### Sinatra vs Rails
![assets/sinatravsrails.png](assets/sinatravsrails.png)

### Steps for building a rails app 
- 1️⃣ Create rails app
```
rails new flatiron-theater-api --api --minimal --skip-javascript -T

```

- 2️⃣ Configure CORS
```
#Gemfile
gem 'rack-cors'

# config/initializers/cores.rb
 Rails.application.config.middleware.insert_before 0, Rack::Cors do
   allow do
     origins '*'

     resource '*',
       headers: :any,
       methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
 end

```
- 3️⃣ Create models, migrations and controllers with Rails generators 
> Note: Do not use Scaffold during phase-4 
```
#List generators 
rails generate

# Create controller 
rails g controller 

# Create model and migration
rails g model

# Create migration 
rails g migration 

# Creates model, migration, controller and routes 
rails g resource model_name attribute:data_type 

ex:
# rails g resource model_name attribute:data_type 
rails g resource production title genre description:text budget:float image director ongoing:boolean

# relationships can be generated with belongs_to or references, belongs_to  is an alias for references. 
rails g resource production_role role understudy:boolean production:belongs_to


```

- 4️⃣ Verify migrations and migrate 

```
rails db:migrate
```

- 5️⃣ Build out relationships 

```
class Production < ApplicationRecord
    has_many :production_roles
    has_many :tickets
    has_many :users, through: :tickets
end

class ProductionRole < ApplicationRecord
  belongs_to :production
end

class Ticket < ApplicationRecord
  belongs_to :production
  belongs_to :user
end

class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets
end

```

- 6️⃣ Create Seeds

- 7️⃣ Restrict routes 

```
# config/routes
Rails.application.routes.draw do
  resources :tickets
  # resources :tickets
  # resources :users
  # resources :production_roles
  resources :productions, only: [:index, :show]
end

# verify routes in the console 
rails routes 

```

- 8️⃣ Add actions
```
class ProductionsController < ApplicationController
    def index
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end
end


```

- 9️⃣ Run server 

```
rails s
```