-- this function is used to init logs file 

-- Example of InformationLine: year / month /  day - hour : min : sec  - PressureValue
-- you can use the following web site to convert epoch time to calendar https://www.epochconverter.com/ 

R1_value = 220
VDD = 3.0  -- Input voltage = 3.3 volt 
InformationLine = ""

-- This function is used to Get pressure value 
function GetPressureValue()

 Voltage = adc.read(0)
 PressionValue = (R1_value/(R1_value+Voltage))* VDD
 print("pression value =" .. PressionValue)
 return PressionValue
 
end 



function Init_Logs(fileName)  
  -- open 'init.lua', print the first line.
  file.remove(fileName)
  
  if  file.open(fileName, "w") then
    print("[File] : "..fileName.." correctly created and opened ")
    file.close()
  else
    print("[Error] :  In try to open file")
  end
  
end 


-- this function is used to store information line in file
function Save_Data_Line(Storingfile, PressureValue) 
    InformationLine = ""
  -- Get and append date-time to information line 
  --  tm = rtctime.epoch2cal(rtctime.get())
  --  print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
    InformationLine = InformationLine .. string.format("%04d/%02d/%02d %02d:%02d:%02d", "2019", "04", "13", "15", "50", "22")
    print("STEP1")
    
    -- Append pressure value to information line 
    InformationLine =  InformationLine .. " - " .. PressureValue

   if file.open(Storingfile, "a+") then
    -- write 'foo bar' to the end of the file
    file.writeline(InformationLine)
    print("Pressure values is stored ")
    file.close()
   end

  return InformationLine
end 


function StartDataprocess(ProcessFile)

   Pr = GetPressureValue()
   Save_Data_Line(ProcessFile,Pr)
   
end 

-- This function is used to start reading and storing pressure values in log file 
function StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)

  

  local timerID = 3
  tmr.alarm(timerID, DataAcquisitionPeriod, 1, function()
    StartDataprocess(AcquisitionFileName) 
  end) -- log Pressure every DataAcquisitionPeriod period 
  
  
end 


-- This function is used to stop data Acquisition process
function StopDataAcquisition()

    local timerID = 3
    tmr.stop(3)
	file.close()

end 

