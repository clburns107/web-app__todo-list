# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/create_todo_form" do
  erb :"todos/create_todo_form"
end

MyApp.post "/submit_todo_form" do
  @task = Todo.new
  @task.title = params[:title]
  @task.description = params[:description]
  @task.user_id = session["user_id"]
  @task.save
  erb :"todos/todo_was_created"
end

MyApp.get "/dashboard" do
  @user_tasks = Todo.where(user_id: session["user_id"])
  erb :"todos/dashboard"
end

MyApp.get "/update_task_form" do
  
  erb :"todos/update_todo"
end

MyApp.post "/submit_update_todo" do

  erb :"todos/todo_was_updated"
end

MyApp.get "/delete_todo" do
  
  erb :"todos/delete_todo"
end

