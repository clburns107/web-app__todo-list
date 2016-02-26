 # This controller is for all the CRUD operations related to a User.

MyApp.get "/create_user_form" do
  erb :"users/create_user_form"
end

MyApp.post "/submit_new_user" do
  @new_user = User.new
  @new_user.name = params[:name]
  @new_user.email = params[:email]
  @new_user.password = params[:password]
  @new_user.save

  if @new_user.password = params[:password]
    session["user_id"] = @new_user.id
    @user_tasks = Assignee.where(user_id: session["user_id"])
    erb :"todos/dashboard"
  else
    erb :"login_error"
  end
end

MyApp.get "/user_account_settings" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    erb :"users/user_account_settings"
  else
    erb :"logins/login_error"
  end
end

MyApp.post "/submit_password_reset" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @update_user = User.find_by_email(params[:email])
    @update_user.password = params[:new_password]
    @update_user.save
  else
    erb :"logins/login_error"
  end
end

MyApp.post "/submit_delete_account" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @delete_user = User.find_by_email(params[:email])
    @delete_user.delete
    erb :"users/user_was_deleted"
  else
    erb :"logins/login_error"
  end
end