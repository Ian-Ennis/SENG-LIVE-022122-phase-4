# Client Server Communication (Part 2)

## Lecture Objectives
- [] Handle validations in the controller
- [] Use strong params
- [] Implement a `destroy` route
- [] Implement an `update` route
- [] Handle foreign key restraint errors  

### Deliverables 
- [] Add Update + Destroy All Controllers

### Domain
![domain_2](assets/domain_2.png)

### dependencies
Rails prevents you from deleting resources if other resources depend on them. 

For example, Ticket holds a Foreign key for Production and User. If we try to `.destroy` a user with one or more associated tickets we will get the following error. 

```
"#<ActiveRecord::InvalidForeignKey: SQLite3::ConstraintException: FOREIGN KEY constraint failed>"

```

There are two ways to deal with this. 
- If you don't need the dependencies, destroy the foreign key dependencies when you destroy a resource.  

```
   has_many :user, dependent: :delete
  # or
   has_many :user, dependent: :destroy

```
- If you need to keep the dependencies, force the foreign key to null using nullify. 

```
  has_many :user, dependent: :nullify
```

### Delete 
To delete a resource:
  - find the resource
  - destroy the resource
    - Confirm it had no foreign key dependencies issues
  - return a response with no content 
  - handle for errors 
```
 def destroy 
        user = User.find(params[:id])
        user.destroy
        head :no_content  
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :not_found
  end 

```

### Update
To Update a resource:
- find the resource 
- use strong params to access the updated params
- update the resource 
- handle validation errors
- return a response with the updated resource 

```
  def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :not_found
    end 
```