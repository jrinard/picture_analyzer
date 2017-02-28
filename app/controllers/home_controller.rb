class HomeController < ApplicationController

def index
  @users = User.all
  @user2 = User.find_by(params[:id]);
  if params[:upvote]
    @user = User.find(params[:upvote])
    @user.liked_by current_user
  end
end

def new

end

def create

end

def show

end

end
