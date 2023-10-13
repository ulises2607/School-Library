require_relative 'nameable'
require_relative 'capitalize'
require_relative 'trimmer'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = next_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def next_id
    @last_id = rand(1000..9999)
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

