class UserController < ApplicationController

  def index
    @list_of_all_users = User.all.order({:created_at => :desc })
    render({:template => "user_templates/index"})
  end

  def show
    render({:template => "user_templates/show"})
  end

end
