Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage"})

  get("/users", {:controller => "user", :action => "index"})
  get("/users/:user_name", {:controller => "user", :action => "show"})
  get("/users", {:controller => "user", :action => "index"})
  post("/insert_user", {:controller => "user", :action => "create"})
  post("/update_user/:modify_id", {:controller => "user", :action => "update"})
  get("/delete_user/:path_id", {:controller => "users", :action => "delete"})

  get("/photos", {:controller => "photos", :action => "index"})
  post("/insert_photo", {:controller => "photos", :action => "create"})
  get("/delete_photo/:path_id", {:controller => "photos", :action => "delete"})
  get("/photos/:photos_id", {:controller => "photos", :action => "show"})
  post("/update_photo/:modify_id", {:controller => "photos", :action => "update"})
  post("/add_comment/", {:controller => "comments", :action => "create"})

end
