class UsersController < ApplicationController
    # GET /users
    def index
        #get users
        render json: User.all, status: :ok
    end    

    # GET /users/{id}
    def show
        #check if user is present
        user = User.find_by(id:params[:id])
        #return user
        if user
            render json: user, status: :ok
        #throw error
        else
            render json: { error: "User not found" }, status: :not_found
        end
    end

    # POST
    def create
        #create a new user
        user = User.create(production_params)
        if user.valid?
            render json:user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # PUT/PATCH /users/{id}
    def update
        # check whether the task exists
        user = User.find_by(id:params[:id])

        if user
            user.update(production_params)
            # return it
            render json: user, status: :accepted
        else
            # throw a not found error
            render json: {error: "User not found"}, status: :not_found
        end
    end

    # DELETE
    def destroy
        # check whether the task exists
        user = User.find_by(id:params[:id])
       
       #  delete the task
       if user
           user.destroy
           head :no_content
       #  return a not found user
       else 
           render json: {error: 'User not found'}, status: not_found
       end
    end

    # AUTHENTICATE A USER
    def login
        # get the user by email
        user = User.find_by(email: params[:email])

        # validate whether the password is true
        if user && user.authenticate(params[:password])
            token = encode_token({id: user.id})
            render json: { user: user, token: token}, status: :ok

        # return an invalid email or password scheme
        else 
            render json: { error: 'Invalid email or password'}, status: :unauthorized
        end
    end

    # GET ALL TASK RELATED TO A USER ID
    def get_all_user_tasks
    end

    # private

    def production_params
        params.permit(:username, :email, :password, :gender)
    end
end


# /users?status="incomplete"&created_at="20/01/2023"