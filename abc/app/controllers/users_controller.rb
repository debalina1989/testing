class UsersController < ApplicationController
def index
@users=User.all
end

def show
@user=User.find(params[:user])
redirect_to users_path
end

def new
@user=User.new
end

def create
User.create(params[:user])
redirect_to user_path(@user)
end

def destroy
@user.destroy
end

end
