class TasksController < ApplicationController
    # protect_from_forgery :except => [:destroy, :create, :update]

    def new
        @post = Task.new
        
    end
    
    def index
        posts = Task.all
        respond_to do |format|      
            format.html
            format.json {render :json => posts}
        end    
        render json: posts
        # render json: posts
    end

    def show
        post = Task.find(params[:id])
        respond_to do |format|      
            format.html
            format.json {render :json => post}
        end    
    end

    def edit
        @post = Task.find(params[:id])
        respond_to do |format|      
            format.html
            format.json {render :json => @post}
        end
        render :json => @post 
    end

    def create
        post_create = Task.create(task_params)
        if post_create.save
            respond_to do |format|      
                format.html
                format.json {render :json => post_create}
            end    
        else
            redirect_to posts_path
        end
    end

    def update
        post_update = Task.find(params[:id])
        if post_update.update(task_params)
            respond_to do |format|      
                format.html
                format.json {render :json => post_update}
            end 
            render :json => post_update
            # redirect_to root_path
        else
            redirect_to root_path
        end
    end

    def destroy
        post = Task.find(params[:id])
        if post.delete
            render json: post
        else
            redirect_to root_path
        end
    end

    private

    def task_params
        params.require(:task).permit(:content, :duedate, :check)
    end
end
