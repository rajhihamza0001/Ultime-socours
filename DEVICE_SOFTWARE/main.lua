-- main 

require "DataProcess"
require "WIFI_CONNECT"


AcquisitionFileName = "blogs.txt"
DataAcquisitionPeriod = 10000 


-- This function is used to Initialize button and LED's perih I/O 

BUTTON = 1

GreenLED  = 2  -- This LED is used to indicate that the system is correctly "running"
RedLED    = 3  -- This LED is used to indicate to user that the system is nicely "powered " 
OrangeLED = 5  -- this LED is used to inform user about the WIFI connection status
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
  gpio.trig(BUTTON, "down", startSystem)

end 

function Perih_init()

  LEDS_Init()
  Button_Init()
  
end

function LED_Blink(LED, NumberOfBlink , BlinkDelay)

   for i = 1,NumberOfBlink do
		gpio.write(LED , gpio.HIGH)
		tmr.delay(BlinkDelay)
		gpio.write(LED , gpio.LOW)
		tmr.delay(BlinkDelay)
   end   

end  

function StartUserInterface()

  tmr.alarm(0, 100, timerMode, function() 

    -- chekc if the device is connected to wifi before starting user interface 
    if( IsConnected() ) then
     
      print("starting user interface ")
      dofile("USER_INTERFACE.lua")
      tmr.stop(0)
      
    end 
  end) -- send data every 10s

end 


function startSystem()

 print("system is started ... ")
 LED_Blink(GreenLED , 3, 1000) -- Blink green led 3 time each on second 
 
 --StartWifiConnect()
 StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)
 --StartUserInterface()
 gpio.mode(BUTTON , gpio.OUTPUT)

end 


Perih_init()
