-- ******** "WIFI_CONNECT.LUA" ******** -- 

-- To do in this file --
-- STEP 1 : Init WIFI configuration --
-- STEP 2 : Set WIFI configuration --
-- STEP 3 : Run WIFI connect Loop until connect status = 5
-- STEP 4 : Branch application to collect data process --

print ("Start WIFI CONNECT process ...")

connected = false 


-- Wifi credentials
SSID = "yess" -- <========== Modify this!
wifiPWD = "123456789" -- <========== Modify this!


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
 if(wifiStat == 5) then  --State: Waiting for wifi
   connected = true
   print("Connected . enjoy :) ")
   print(wifi.sta.getip())
   tmr.stop(timerID)
 end
end



tmr.alarm(timerID, timerDelay, timerMode, function() wifi_connect() end) -- send data every 10s


if(connected == true) then
 dofile("USER_INTERFACE.lua")
end 