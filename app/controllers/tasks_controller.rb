class TasksController < ApplicationController

    before_action :authorize

    # GET /tasks
    def index
        render json: Task.all, status: :ok
    end

    # GET /tasks/{id}
    def show
        # check whether the task exists
        task = Task.find_by(id:params[:id])

        if task
            # return it
            render json: task, status: :ok
        else
            # throw a not found error
            render json: {error: "Task not found"}, status: :not_found
        end
    end
        
    # POST /tasks
    def create
        # get the body of the task to be created
        task = Task.create(task_params)
    
        # check whether the task is valid => valid
        if task.valid?
            # add the tasks to the db if its valid
            render json: task, status: :accepted
        else
            # throw an unprocessable entity error the user
            render json: {errors: "An error occured. Please try again"}
        end
    end

    # PUT/PATCH /tasks/{id}
    def update
        # check whether the task exists
        task = Task.find_by(id:params[:id])

        if task
            task.update(task_params)
            # return it
            render json: task, status: :accepted
        else
            # throw a not found error
            render json: {error: "Task not found"}, status: :not_found
        end
    end

    # DELETE /tasks/{id}
    def destroy
         # check whether the task exists
         task = Task.find_by(id:params[:id])
        
        #  delete the task
        if task
            task.destroy
            head :no_content
        #  return a not found task
        else 
            render json: {error: 'Task not found'}, status: not_found
        end
    end

    private

    def task_params
        params.permit(
            :task_name, :task_description, :task_status, :user_id
        )
    end
end
