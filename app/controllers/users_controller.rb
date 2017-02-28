class UsersController < ApplicationController
  def show
    @user = current_user
    @user2 = User.find(params[:id])
    @message = Message.new
  end
end
