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
  erb :"users/user_was_created"
end

MyApp.get "/user_account_settings" do
  erb :"users/user_account_settings"
end

MyApp.post "/submit_password_reset" do
  @update_user = User.find_by_email(params[:email])
  @update_user.password = params[:new_password]
  @update_user.save
  erb :"users/password_was_updated"
end

MyApp.post "/submit_delete_account" do
  @delete_user = User.find_by_email(params[:email])
  @delete_user.delete
  erb :"users/user_was_deleted"
end