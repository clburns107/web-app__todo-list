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

    @task1 = Todo.new
    @task1.title = "Bark"
    @task1.description = "bark at the neighbor kids"
    @task1.completed = false
    @task1.user_id = @dog2.id
    @task1.creator_id = @dog1.id
    @task1.assignor_id = @dog1.id
    @task1.save
    
  end

  def test_potato
    assert_equal("delicious", @potato)
  end
  
  def test_creator
    assert_includes(@dog1.name, @task1.creator)
  end

  def test_assignor
    assert_includes(@dog1.name, @task1.assignor)
  end
end