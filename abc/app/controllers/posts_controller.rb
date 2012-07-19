class PostsController < ApplicationController

def index
@posts=Post.all
end

def show
@post=Post.find(params[:id])
end

def new
@post=Post.new
end

def create
Post.create(params[:post])
redirect_to posts_path
end

def edit
@post=Post.find(params[:id])
end

def update
@post=Post.find(params[:id])
@post.update_attributes(params[:post])
redirect_to posts_path
end

def destroy
Post.destroy(params[:id])
redirect_to posts_path
end

end
