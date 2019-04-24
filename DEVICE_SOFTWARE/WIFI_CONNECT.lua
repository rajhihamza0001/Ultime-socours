-- ******** "WIFI_CONNECT.LUA" ******** -- 

-- To do in this file --
-- STEP 1 : Init WIFI configuration --
-- STEP 2 : Set WIFI configuration --
-- STEP 3 : Run WIFI connect Loop until connect status = 5
-- STEP 4 : Branch application to collect data process --

require "Device_Config"

ConnectionState = false 


timerID = 2
timerDelay = 5000
timerMode = 1

wifiStat = 0

function wifi_connect()
 print("Trying To Connect ...")
 wifi.setmode(wifi.STATION)
 wifi.sta.config(SSID,wifiPWD)
 wifi.sta.connect()
 wifiStat = wifi.sta.status()
 LED_Blink(OrangeLED,2,LED_TryingToConnectDelay)
 if(wifiStat == 5) then  --State: Waiting for wifi
   connected = true
   print("Connected . enjoy :) ")
   print(wifi.sta.getip())
   tmr.stop(timerID)
   ConnectionState = true 
 end
end

function IsConnected ()
 ConnectionState = false 
 wifiStat = wifi.sta.status()
 if(wifiStat == 5) then 
   ConnectionState = true 
 end 
 return ConnectionState 
end

function CheckWifiStatus()

  if (IsConnected == false ) then 
    StartWifiConnect()
  end 

end 

function StartWifiConnect()
  print ("Start WIFI CONNECT process ...")
  tmr.alarm(timerID, timerDelay, timerMode, function() wifi_connect() end) -- send data every 10s

end 
