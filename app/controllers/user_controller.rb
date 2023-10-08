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

end
