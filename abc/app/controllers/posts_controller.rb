class PostsController < ApplicationController

def new
@user=User.find(params[:user_id])
@post=@user.posts.new
end

def create
@user=User.find(params[:user_id])
@post=@user.posts.create(params[:post])
redirect_to user_path(@user)
end

def show
@user=User.find(params[:id])
@post=@user.posts.find(params[:user_id])
end

def destroy
@user=User.find(params[:id])
@user.posts.destroy(params[:user_id])
redirect_to user_path(@user)
end

end
