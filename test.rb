# Clase base Nameable
class Nameable
    def correct_name
      raise NotImplementedError, "Este método debe ser implementado en una subclase."
    end
  end
  
  # Clase Persona heredando de Nameable
  class Persona < Nameable
    def initialize(name)
      @name = name
    end
  
    def correct_name
      @name
    end
  end
  
  # Clase base Decorador
  class Decorador < Nameable
    def initialize(nameable)
      @nameable = nameable
    end
  
    def correct_name
      @nameable.correct_name
    end
  end
  
  # Clase CapitalizeDecorator
  class CapitalizeDecorator < Decorador
    def correct_name
      super().capitalize
    end
  end
  
  # Clase TrimmerDecorator
  class TrimmerDecorator < Decorador
    def correct_name
      super()[0, 10]
    end
  end
  
  # Ejemplo de uso
  persona = Persona.new("juanito perez")
  decorador1 = CapitalizeDecorator.new(persona)
  decorador2 = TrimmerDecorator.new(persona)
  
  puts persona.correct_name  # Output: "juanito perez"
  puts decorador1.correct_name  # Output: "Juanito perez"
  puts decorador2.correct_name  # Output: "juanito pe"
  