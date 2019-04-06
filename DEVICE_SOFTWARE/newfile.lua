
GREEN_LED = 3 
RED_LED = 2

R1_value = 220
VDD = 3.0  -- Input voltage = 3.3 volt 


function SensorsInit()

 gpio.mode(GREEN_LED,gpio.OUTPUT)
 gpio.mode(RED_LED,gpio.OUTPUT)

end 


function PressionRead()

 Voltage = adc.read(0)
 PressionValue = (R1_value/(R1_value+Voltage))* VDD
 print("pression value =" .. PressionValue)
 return PressionValue
end 


function StorePression()

  Pr = PressionRead()
  -- open 'init.lua' in 'a+' mode
  fd = file.open("init.lua", "a+")
  if fd then
    -- write 'pression value ' to the end of the file
    fd:write(Pr)
    fd:close()
  end

end 

function GREEN_LED_BLINK(BlinkNumber, TimeOut)

   for i = 1,BlinkNumber do
      gpio.write(GREEN_LED,gpio.HIGH)
      tmr.delay(TimeOut)
      gpio.write(GREEN_LED,gpio.LOW)
      tmr.delay(TimeOut)
   end
   
end 

function RED_LED_BLINK(BlinkNumber, TimeOut)

   for i = 1,BlinkNumber do
      gpio.write(RED_LED,gpio.HIGH)
      tmr.delay(TimeOut)
      gpio.write(RED_LED,gpio.LOW)
      tmr.delay(TimeOut)
   end
   
end 

