# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/create_todo" do
  erb :"todos/create_todo"
end

MyApp.post "/submit_todo" do
  erb :"todo_was_created"
end