require "Device_Config"

function LEDS_Init()
  
  gpio.mode(GreenLED , gpio.OUTPUT)
  gpio.mode(RedLED   , gpio.OUTPUT)
  gpio.mode(OrangeLED, gpio.OUTPUT)
  
  gpio.write(GreenLED , gpio.LOW)
  gpio.write(RedLED   , gpio.LOW)
  gpio.write(OrangeLED, gpio.LOW)

end


function Button_Init()

  gpio.mode(BUTTON,gpio.INT)
  gpio.trig(BUTTON, "down", startSystem)

end 

function Perih_init()

  LEDS_Init()
  Button_Init()
  
end

function LED_Blink(LED, NumberOfBlink , BlinkDelay)

   BlinkDelay = BlinkDelay * 1000
   for i = 1,NumberOfBlink do
        gpio.write(LED , gpio.HIGH)
        tmr.delay(BlinkDelay)
        gpio.write(LED , gpio.LOW)
        tmr.delay(BlinkDelay)
   end   

end 

function LED_ON(LED)
        gpio.write(LED , gpio.HIGH)
end  

function LED_OFF(LED)
        gpio.write(LED , gpio.LOW)
end  
 