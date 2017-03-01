class PicturesController < ApplicationController

def index
  @pictures = Picture.all
  @user = current_user
end

def show
  @picture = Picture.find(params[:id])
   @task_id = @picture.get_task
   @details = @picture.get_details
end

def new
  @picture = Picture.new
end

def create
   @user = current_user
   @picture = Picture.new(picture_params)
   if @picture.save
     flash[:notice] = "Picture Saved!"
     redirect_to root_path
   else
     render :new
   end
end

def edit
end

def update
end

def destroy
end

def picture_params
   params.require(:picture).permit(:image, :title, :description, :url, :task_id, :user_id => current_user.id )
  end


end
