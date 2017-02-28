class InstagramsController < ApplicationController

def index
  @user = current_user
  # @messages = Message.all
end

def create
  # @message = Message.new(message_params)
  # if @message.save
  #   flash[:notice] = "Sent!"
  #   redirect_to messages_path
  else
    render 'new'
  end
end

def show
  # @message = Message.find(params[:id])
end

private

 def message_params
   params.require(:message).permit(:to, :from, :body)
 end
end
