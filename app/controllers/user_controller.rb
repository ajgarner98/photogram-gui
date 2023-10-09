class UserController < ApplicationController

  def index
    @list_of_all_users = User.all.order({:created_at => :desc })
    
    render({:template => "user_templates/index"})
  end

  def show
    @the_user = params.fetch("user_name")
    @the_name = User.where({:username => @the_user }).at(0)
    
    render({:template => "user_templates/show"})
  end

  def create
    user_name = params.fetch("user_name")

    new_user = User.new

    new_user.username = user_name

    new_user.save
    # render({:template =>"photo_templates/create"})
    redirect_to("/users/#{new_user.username}")
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users = User.where({:username => the_id})
    @the_user = matching_users.at(0)

    input_user = params.fetch("user_name")

    @the_user.username = input_user

    @the_user.save

    redirect_to("/users/#{@the_user.username}") 
  
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")

    
  end
end
