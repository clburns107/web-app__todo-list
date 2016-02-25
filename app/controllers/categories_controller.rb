MyApp.post "/submit_new_category" do
  new_category = Category.new
  new_category.name = params[:category]
  new_category.save
  redirect "/user_account_settings"
end