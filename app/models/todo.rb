class Todo < ActiveRecord::Base

  #Returns name of creator for todo item
  def creator
    creator= User.find_by_id(self.creator_id)
    return creator.name
  end

  
  #Returns name assignor for todo item
  def assignor
    assignor= User.find_by_id(self.assignor_id)
    return assignor.name
  end

  #Returns name of category for todo item
  def category
    category= Category.find_by_id(self.category_id)
    return category.name
  end

  #Assigns multiple users to a todo item
  def set_assignees(dog_ids_array)
    position = 0
    count = 0

    while count < dog_ids_array.count
      x = Assignee.new
      x.todo_id = self.id
      x.save
      count += 1
    end

    assignments = Assignee.where({todo_id: self.id, user_id: nil})
    assignments.each do |x|
      x.user_id = dog_ids_array[position]
      x.save
      position += 1
    end
  end


end


