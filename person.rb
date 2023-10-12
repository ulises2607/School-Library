class Person < Nameable
  @last_id = 0
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = next_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def next_id
    @last_id += 1
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
  
end
