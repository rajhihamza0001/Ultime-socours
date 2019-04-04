  gpio.mode(3,gpio.OUTPUT)
 gpio.mode(2,gpio.OUTPUT)
 
PressionValue = 0

 while true do
   PressionValue = adc.read(0)
   A=(220/(220+PressionValue))*3
   if   (A >1 )then 
      gpio.write(3,gpio.LOW) 
      tmr.delay(100000)
    print("pression value =")
    
     print(A)
   
gpio.write(2,gpio.HIGH)
 tmr.delay(100000)
gpio.write(2,gpio.LOW)
tmr.delay(100000)

else 
gpio.write(2,gpio.LOW)
   tmr.delay(100000)
print("pression value =")
 print(A)

gpio.write(3,gpio.HIGH)
 tmr.delay(100000)
gpio.write(3,gpio.LOW)
tmr.delay(100000)
end 

end
