class Decorador < Nameable
    def initialize(nameable)
        @bnameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end

end
