## Ruby Library for electronics

### Resistor Color Code Calculator

Accepts 4 arguments (first 3 bands determine resistor value, 4th band is for tolerance %), though none are required to return a value of 0 ohms. You must preserve order of bands as arguments.

    resistor = Electric::Resistor.new("red", "black", "brown")
    resistor.value
    => 200
    resistor.tolerance
    => "5%"
    resistor.human_readable
    => "200 ohms, +/- 5%"

### Ohm's Law Calculator

Accepts 4 named arguments: "volts", "ohms", "amps", and "watts" in any order. You must provide at least 2 properties to calculate other 2. 

There are 4 methods that can be called to run calculations: "resistance", "power", "voltage", and "current"

    ohm = Electric::Ohm.new(:volts => 5, :ohms => 330)
    ohm.voltage
    => 5.0
    ohm.resistance
    => 330.0
    ohm.current
    => 0.015151515151515152
    ohm.power
    => 0.07575757575757576


More documentation on the way...

## Bug reports and Pull requests

Please open an issue on Github if you find a bug, and I will address it.

If you have an improvement to submit, please fork the repo, add your code and send a pull request.


