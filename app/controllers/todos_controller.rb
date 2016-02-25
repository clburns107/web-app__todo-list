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

MyApp.get "/update_task_form/:todo_id" do
  @todo_id = params[:todo_id]
  erb :"todos/update_todo"
end

MyApp.post "/submit_update_todo/:todo_id" do
  @update_task = Todo.find_by_id(params[:todo_id])
  @update_task.title = params[:title]
  @update_task.description = params[:description]
  @update_task.save
  erb :"todos/todo_was_updated"
end

MyApp.get "/delete_todo/:todo_id" do
  @delete_task = Todo.find_by_id(params[:todo_id])
  @delete_task.delete
  erb :"todos/delete_todo"
end

