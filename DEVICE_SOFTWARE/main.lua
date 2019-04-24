-- main 

require "DataProcess"
require "WIFI_CONNECT"
require "Device_Config"
require "Sensors"





function StartUserInterface()

  tmr.alarm(0, 100, timerMode, function() 

    -- chekc if the device is connected to wifi before starting user interface 
    if( IsConnected() ) then
     
      print("starting user interface ")
      tmr.stop(0)
      dofile("USER_INTERFACE.lua")
      
    end 
  end) -- send data every 10s

end 


function startSystem()

 print("system is started ... ")
 LED_ON(RedLED)
 LED_Blink(GreenLED , 3, 1000) -- Blink green led 3 time each on second 
 
 StartWifiConnect()
 
 Init_Logs(AcquisitionFileName) 
 StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)
 
 StartUserInterface()
 gpio.mode(BUTTON , gpio.OUTPUT)

end 


Perih_init()
