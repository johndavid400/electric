module Electric
  class Ohm

    attr_accessor :ohms, :volts, :amps, :watts

    def initialize(options={})
      ohms = options["ohms"] || options[:ohms] || options["resistance"] || options[:resistance]
      @ohms = ohms.to_f if ohms.present?
      volts = options["volts"] || options[:volts] || options["voltage"] || options[:voltage]
      @volts = volts.to_f if volts.present?
      amps = options["amps"] || options[:amps] || options["current"] || options[:current] || options["amperage"] || options[:amperage]
      @amps = amps.to_f if amps.present?
      watts = options["watts"] || options[:watts] || options["power"] || options[:power]
      @watts = watts.to_f if watts.present?
      calculate
    end

    def resistance
      ohms ? ohms : get_resistance
    end

    def voltage
      volts ? volts : get_voltage
    end

    def current
      amps ? amps : get_current
    end

    def power
      watts ? watts : get_power
    end

    def calculate
      @ohms = get_resistance unless @ohms
      @volts = get_voltage unless @volts
      @amps = get_current unless @amps
      @watts = get_power unless @watts
    end

    private

    def get_resistance
      if watts && amps
        # P / I^2
        watts / (amps * amps)
      elsif volts && amps
        # V / I
        volts / amps
      elsif volts && watts
        # V^2 / P
        (volts * volts) / watts
      else
        ohms if ohms
      end
    end

    def get_voltage
      if ohms && amps
        # I * R
        amps * ohms
      elsif watts && amps
        # P / I
        watts / amps
      elsif ohms && watts
        # sq_root(P * R)
        Math.sqrt(watts * ohms)
      else
        volts if volts
      end
    end

    def get_current
      if watts && volts
        # P / V
        watts / volts
      elsif volts && ohms
        # V / R
        volts / ohms
      elsif watts && ohms
        # sq_root(P) / R
        Math.sqrt(watts) / ohms
      else
        amps if amps
      end
    end

    def get_power
      if volts && amps
        # V * I
        volts * amps
      elsif volts && ohms
        # V^2 / R
        (volts * volts) / ohms
      elsif amps && ohms
        # I^2 * R
        (amps * amps) * ohms
      else
        watts if watts
      end
    end

  end
end
