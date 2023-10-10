require './Person.rb'

class Student < Person
    def initialize(age, name, classroom)
        super(age, name)
        @classroom = classroom
    end

    def name=(newName)
        @name = newName + "Cambio de nombre desde estudiante"
    end

    def play_hooky
        return "¯\(ツ)/¯"
    end

end
