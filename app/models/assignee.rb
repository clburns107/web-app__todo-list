class Assignee < ActiveRecord::Base
  
  #Class Method for collection
  #
  #Returns all todo items assigned to an assignee
  class << self
    def todo_items
      task = Todo.find_by_id(self.todo_id)
      return task
    end
  end

  # returns a todo object for an assignee
  def todo_object
    task = Todo.find_by_id(self.todo_id)
    return task
  end

  # returns a category object for a todo for an assignee
  def category_object
    task = Todo.find_by_id(self.todo_id)
    category = Categories.find_by_id(task.category_id)
    return category
  end
  
  

end