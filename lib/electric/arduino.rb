module Electric
  class Arduino

    attr_accessor :multiplier, :value

    def initialize(value)
      @multiplier = 5000.0 / 1023.0 # equals 4.887585532746823
      @value = value
    end

    def to_analog
      (value / multiplier).to_i
    end

    def to_voltage
      value * multiplier
    end

  end
end
