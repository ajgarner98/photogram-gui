Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage"})

  get("/users", {:controller => "user", :action => "index"})
  get("/users/:user_name", {:controller => "user", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photos_id", {:controller => "photos", :action => "show"})

end
