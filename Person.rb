class Person
    @@last_id = 0

    def initialize(age, name="Unknown", parent_permission=true)
        @id = next_id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end
    attr_reader :id
    attr_accessor :name
    attr_accessor :age

    def next_id
        @@last_id += 1
    end

    def of_age?
        return @age >= 18
    end

    def can_use_services?
        return self.of_age? || @parent_permission
    end

end
