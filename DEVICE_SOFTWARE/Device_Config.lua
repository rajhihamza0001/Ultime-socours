
-- Wifi credentials
SSID = "yess" -- <========== Modify this!
wifiPWD = "123456789" -- <========== Modify this!


AcquisitionFileName = "blogs.txt"
DataAcquisitionPeriod = 2000 


-- This function is used to Initialize button and LED's perih I/O 

BUTTON = 2

GreenLED  = 7  -- This LED is used to indicate that the system is correctly "running"
RedLED    = 5  -- This LED is used to indicate to user that the system is nicely "powered " 
OrangeLED = 6  -- this LED is used to inform user about the WIFI connection status
                    -- LED OFF : system is not connected to AP.
                    -- LED BLINK every one second : system try to connect to AP.
                    -- LED BLINK every 60 second  : system is correctly connected to AP.

LED_TryingToConnectDelay = 50 -- 1000 ms 
LED_CorrectlyConnectedDelay = 36000 -- 36000 ms = 1 min  