module Electric
  class Resistor
    attr_accessor :first, :second, :third, :fourth

    def initialize(first = "black", second = "black", third = "black", fourth = "gold")
      @first = first
      @second = second
      @third = third
      @fourth = fourth
    end

    def human_readable
      if value >= 1000000
        "#{round_for(value / 1000000.0)}M ohms, +/- #{color_to_tolerance(@fourth)}"
      elsif value >= 1000
        "#{round_for(value / 1000.0)}K ohms, +/- #{color_to_tolerance(@fourth)}"
      else
        "#{value} ohms, +/- #{color_to_tolerance(@fourth)}"
      end
    end

    def value
      "#{color_to_number(first)}#{color_to_number(second)}".to_i * color_to_multiplier(third)
    end

    def tolerance
      color_to_tolerance(@fourth)
    end

    private

    def color_to_number(color)
      colors = {
        "black" => 0,
        "brown" => 1,
        "red" => 2,
        "orange" => 3,
        "yellow" => 4,
        "green" => 5,
        "blue" => 6,
        "violet" => 7,
        "grey" => 8,
        "gray" => 8,
        "white" => 9
      }
      colors[color.downcase]
    end

    def color_to_multiplier(color)
      colors = {
        "black" => 1,
        "brown" => 10,
        "red" => 100,
        "orange" => 1000,
        "yellow" => 10000,
        "green" => 100000,
        "blue" => 1000000,
        "violet" => 10000000,
        "grey" => 100000000,
        "gray" => 100000000,
        "white" => 1000000000
      }
      colors[color.downcase]
    end

    def color_to_tolerance(color)
      colors = {
        "gold" => "5%",
        "silver" => "10%"
      }
      colors[color.downcase]
    end

    def round_for(float_val)
      if float_val % 1 == 0
        float_val.to_i
      else
        float_val
      end
    end

  end
end
