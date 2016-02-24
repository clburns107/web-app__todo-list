# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/" do
  erb :"logins/login_form"
end

MyApp.post "/submit_logout" do
  session["user_id"] = nil
  erb :"logins/logout_success"
end

MyApp.get "/login_error" do
  erb :"logins/login_error"
end


MyApp.post "/submit_login" do
@current_user = User.find_by_email(params[:email])
  if @current_user.password == params[:password]
    session["user_id"] = @current_user.id
    @user_tasks = Todo.where(user_id: session["user_id"])
    erb :"todos/dashboard"
  else
    erb :"logins/login_error"
  end
end
