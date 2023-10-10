require './Person.rb'

class Teacher < Person
    def initialize(age, name, specialization)
        super(age, name)
        @specialization = specialization
    end

    def can_use_services?
        return true
    end

end



