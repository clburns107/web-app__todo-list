class Assignee < ActiveRecord::Base
  
  #Class Method for collection of an assignee's assignments
  #
  #takes an argument of a collection of assignments
  #
  #Returns all todo items assigned to an assignee
    def self.todo_items(assignments)
      all_tasks = []
      assignments.each do |assignment|
        all_tasks= Todo.where(id: assignment.todo_id)
      end
      return all_tasks
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