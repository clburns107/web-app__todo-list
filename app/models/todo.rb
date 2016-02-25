class Todo < ActiveRecord::Base

  #Returns name assigned to creator id
  def creator
    creator= User.find_by_id(self.creator_id)
    return creator.name
  end

  
  #Returns name assigned to assignor id
  def assignor
    assignor= User.find_by_id(self.assignor_id)
    return assignor.name
  end

end
