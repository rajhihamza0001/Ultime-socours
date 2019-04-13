-- main 

require "DataProcess"


AcquisitionFileName = "Logs.txt"
DataAcquisitionPeriod = 5000 

StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)


-- This function is used to Initialize button and LED's perih I/O 

BUTTON = 1

GreenLED  = 4  -- This LED is used to indicate that the system is correctly "running"
RedLED    = 3  -- This LED is used to indicate to user that the system is nicely "powered " 
OrangeLED = 2  -- this LED is kused to inform user about the WIFI connection status
					-- LED OFF : system is not connected to AP.
					-- LED BLINK every one second : system try to connect to AP.
					-- LED BLINK every 60 second  : system is correctly connected to AP.

LED_TryingToConnectDelay = 1000 -- 1000 ms 
LED_CorrectlyConnectedDelay = 36000 -- 36000 ms = 1 min  


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
  trig(BUTTON, "down", startSystem)

end 

function Perih_init()

  LEDS_Init()
  Button_Init()
  
end

function GreenBlink(LED, NumberOfBlink , BlinkDelay)

   for i = 1,NumberOfBlink do
		gpio.write(LED , gpio.HIGH)
		tmr.delay(BlinkDelay)
		gpio.write(LED , gpio.LOW)
		tmr.delay(BlinkDelay)
   end   

end  

function startSystem()

 print("system is started ... ")
 GreenBlink(GreenLED , 3, 1000) -- Blink green led 3 time each on second 
 

end 


startSystem()

