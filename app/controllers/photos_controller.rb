class PhotosController < ApplicationController

  def index
    
    @list_of_all_photos = Photo.all.order({:created_at => :desc})
    render({:template =>"photo_templates/index"})
  end

  def show
    photo_id = params.fetch("photos_id")
    @the_photos = Photo.where({:id => photo_id}).at(0)
    render({:template =>"photo_templates/show"})
  end

  def create
    one_image = params.fetch("image_query")
    one_caption = params.fetch("caption_query")
    one_id = params.fetch("id_query")

    new_photo = Photo.new

    new_photo.owner_id = one_id
    new_photo.caption = one_caption
    new_photo.image = one_image

    new_photo.save
    # render({:template =>"photo_templates/create"})
    redirect_to("/photos/#{new_photo.id}")

    
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("image_query")
    input_caption = params.fetch("caption_query")

    the_photo.caption = input_caption
    the_photo.image = input_image

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")

    
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")

    
  end

end
