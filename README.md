# Water Level Controller
A water level controller is a device which is used to detect the amount of water present in the tank and alert the user for low or dangerously high water level. It has a wide set of applications such as water and sewer services for office and apartment buildings, industrial applications for iron and steel, food, chemical, pharmaceutical, and semiconductor industries.

## Objective 
The objective of the project was to design a water controller that can:-
 - Monitor the level of water and switch on the supply when the tank is empty and switch off the supply when the tank is full.
 - Alert the user while doing so.
 - To make sure to save as much as water and energy as possible.
 
 ## Existing Solutions
 The types of water level indicators are:-
  - Floatless level indicators
  - Single point level indicators
  - Hanging water level sensors
  - Spark plug water level indicators
  - PVC water level sensors
  - Swimming water level sensors 
   
  ### Floatless level indicators
  Floatless relays are level controllers that detect water levels based on the conductivity of the medium measured by using conductive electrodes. When a relay senses the liquid level measured, the output contacts of the relay are energized and latched.
  
  ### Single point level indicators
  Point level switches are often used as a warning indicator to trigger an alert when a fluid level is either too high or too low within a tank or vessel. A single point level switch detects if a predetermined single liquid level is reached and actuates a switch to notify a user. Single point level switches are available in multiple sensing technologies including float, electro-optic, ultrasonic, capacitive, and water in fuel.
  
  ### Hanging water level sensors
  Universal Hanging sensors can be used in the cases where there is not enough over head clearance to allow for the solid sensor rods we typically would like to see. Each sensor is set and secured with a conventional compression fitting to insure it stays at the correct level and is also color coded so it can be Identified all the way through to the Control panel.
  
  ### Spark plug water level indicators
  The only Solid-state all Electronic Float switch with no moving parts. It works in any water environment where float switches are used.

  ### PVC water level sensors
  Alternatives to electronic float switches and use no moving parts.They work in any water environment where you would use float switches. It’s press in plug and presses into its respective spell styled coupler.
  
  ### Swimming water level sensors
  Pool water level control sensors work by using 2 rods that come into contact with the pool waters surface. The energized sensor rods close the water filler valve by making a circuit when both sensors are in contact with the water. When the water level drops below one of the rods it opens up the circuit and turns on the automatic pool filler valve. The auto fill valve will stop filling again once both water level sensors are in contact with the pool water surface again. 

 ### Disadvantages
 The shortcomings of the water controllers and float switches in the market are:-
  - Water level controls need to be replaced every 3 years.
  - The floats in float switches would rust, foul and deteriorate
  - Electronics are usually required to be built separately
  - More difficult installation
  - Most float switches are outdated
  - No LED indicator lights
  - No Warranty or Guarantee
 
## Working Principle
 - Water is the conductor electricity. We use this principle to display messages on microcontroller, which are dipped in water, they detect electricity and subsequently send signal to the microcontroller indicating the level of water present in the tank and conveying whether the motor should be switched on or off.
 - When water level in the tank is low the motor is automatically switched on to fill the tank with the water and also subsequently display the message that the tank is empty on the lcd display.
 -  When water in the tank is filled to it's maximum the motor is switched off automatically and the lcd displays the message indicating that the tank is full.

## Circuit Explanation
 - The water level probes are connected to the P0.0, P0.1 and P0.2 through the transistors (they are connected to the base of the transistors through corresponding current limiting resistors). P0.0 for LOW level, P0.1 for HALF Level and P0.2 for HIGH Level.
 - The Collector terminals of the Transistors are connected to VCC and the Emitter terminals are connected to PORT0 terminals (P0.0, P0.1 and P0.2).
 - PORT1 of the microcontroller is connected to the data pins of LCD and the control pins RS, RW and EN of the LCD Display are connected to the P3.6, GND and P3.7 respectively.
 - For demonstration purpose, we have used a simple DC Motor Pump. It is connected to the Relay and the input to the relay is fed from P0.7 through a transistor.
### Components Required
 - 8051
 - 5 x 10kR resistors
 - 1 x relay
 - 1 x dc motor pump
 - 1 x alternator
 - 2 x 1nF capacitors
 - 1 x LCD
 - 1 x 100R resistor
 - 1 x generic electrolyte capacitor
 - 1 x generic non-electrolyte capacitor
 - 5 x buttons
 
 ## Algorithm
 - First configure the controller pins P0.0, P0.1 and P0.2 as inputs and P0.7 as output.
 - Now, initialize the LCD.
 - Continuously check the water level input pins P0.0, P0.1 and P0.2.
 - If all the pins are low, then display tank as “EMPTY” on the LCD and make P0.7 pin HIGH to run the motor automatically.
 - If the level is low i.e. if P0.0 is HIGH, display the water level as “LOW” and continue to run the motor.
 - A HIGH pulse on the pin P0.1 indicates that water has reached half level. So, display the same thing on LCD and run the motor normally.
 - If P0.2 is HIGH, then the water level in the tank is FULL.
 - Now, make the P0.7 pin as LOW to turn off the motor automatically.
 
 ## Limitations
 - 8051 uses more number of clock cycles for instruction execution. Thus it cant be used for high speed applications.
 - We use external oscillator in 8051 which adds to external circuitry.
 - 8051 does not have inbuilt ADC
 - 8051 has 11.0592 MHz frequency which is slower compared to other microcontrollers.

 ## Working
 ![Video](water-project.mp4)
