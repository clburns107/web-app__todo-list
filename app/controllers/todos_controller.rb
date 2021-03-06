# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/create_todo_form" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @categories = Category.all
    @dogs = User.all
    erb :"todos/create_todo_form"
  else
    erb :"logins/login_error"
  end
end

MyApp.post "/submit_todo_form" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @task = Todo.new
    @task.title = params[:title]
    @task.description = params[:description]
    @task.category_id = params[:category_id]
    @task.creator_id = session["user_id"]
    @task.assignor_id = session["user_id"]
    @task.save
    @task.set_assignees(params[:user_id_numbers])

    redirect "/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/dashboard" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @all_assignments= Assignee.where(user_id: session["user_id"])
    @todo_tasks = Assignee.todo_items(@all_assignments)
      if @todo_tasks == []
        @user_tasks = []
      else
        @user_tasks = @todo_tasks.order(:category_id)
      end
    erb :"todos/dashboard"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/update_task_form/:todo_id" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @todo_id = params[:todo_id]
    erb :"todos/update_todo"
  else
    erb :"logins/login_error"
  end
end

MyApp.post "/submit_update_todo/:todo_id" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @update_task = Todo.find_by_id(params[:todo_id])
    @update_task.title = params[:title]
    @update_task.description = params[:description]
    @update_task.save
    erb :"todos/todo_was_updated"
  else
    erb :"logins/login_error"
  end
end

MyApp.get "/delete_todo/:todo_id" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil 
    @delete_task = Todo.find_by_id(params[:todo_id])
    @delete_task.delete
    erb :"todos/delete_todo"
  else
    erb :"logins/login_error"
  end
end

