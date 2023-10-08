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

end
