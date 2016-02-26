require 'test_helper'

class TodoTest < Minitest::Test
  def setup
    super
    
    @potato = "delicious"

    @dog1 = User.new
    @dog1.name = "Fido"
    @dog1.email = "fido@fido.com"
    @dog1.password = "fidoisawesome"
    @dog1.save

    @dog2 = User.new
    @dog2.name = "Roscoe"
    @dog2.email = "roscoe@roscoe.com"
    @dog2.password = "roscoetherumrunner"
    @dog2.save

    @category1 = Category.new
    @category1.name = "Sit"
    @category1.save

    @category2 = Category.new
    @category2.name = "Speak"
    @category2.save

    @category3 = Category.new
    @category3.name = "Lay Down"
    @category3.save


    @task1 = Todo.new
    @task1.title = "Bark at the window"
    @task1.description = "bark at the neighbor kids"
    @task1.completed = false
    @task1.assignor_id = @dog1
    @task1.creator_id = @dog1
    @task1.category_id = 
    @task1.save

    @task1 = Todo.new
    @task1.title = "Sit at the door"
    @task1.description = "wait for the mailman"
    @task1.completed = false
    @task1.assignor_id = @dog1
    @task1.creator_id = @dog1
    @task1.category_id = 
    @task1.save

    @task1 = Todo.new
    @task1.title = "Lay down on the bed"
    @task1.description = "sleep on the pillows"
    @task1.completed = false
    @task1.assignor_id = @dog2
    @task1.creator_id = @dog2
    @task1.category_id = 
    @task1.save


    @assignment1 = Assignee.new
    @assignment1.user_id = 1
    @assignment1.todo_id = 1

    @assignemnt2 = Assignee.new
    @assignment2.user_id = 1
    @assignment2.todo_id = 2

    @assignemnt3 = Assignee.new
    @assignment3.user_id = 1
    @assignment3.todo_id = 3

    
  end

  def test_potato
    assert_equal("delicious", @potato)
  end
  
  def test_todo_items
    assert_includes(@dog1.name, @task1.creator)
  end

  
end