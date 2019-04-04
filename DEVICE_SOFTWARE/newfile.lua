  gpio.mode(3,gpio.OUTPUT)
 gpio.mode(2,gpio.OUTPUT)
 
PressionValue = 0

 while true do
   PressionValue = adc.read(0)
   print("pression value =")
   
   if   (PressionValue >10 )then 
      gpio.write(3,gpio.LOW) 
      tmr.delay(1000000)
     print("pression value =")
     print( PressionValue)
   
gpio.write(2,gpio.HIGH)
 tmr.delay(1000000)
gpio.write(2,gpio.LOW)
tmr.delay(1000000)

else 
gpio.write(2,gpio.LOW)
   tmr.delay(1000000)
print("pression value =")
 print( PressionValue)

gpio.write(3,gpio.HIGH)
 tmr.delay(1000000)
gpio.write(3,gpio.LOW)
tmr.delay(1000000)
end 

end
