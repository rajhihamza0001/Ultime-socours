-- this function is used to init logs file 

-- Example of InformationLine: year / month /  day - hour : min : sec  - PressureValue
-- you can use the following web site to convert epoch time to calendar https://www.epochconverter.com/ 


-- This function is used to Get pressure value 
function GetPressureValue()


  return 24
end 



function Init_Logs(fileName)  
  -- open 'init.lua', print the first line.
  fd = file.open(fileName, "a+")
  if fd then
    print("[File] : "..fileName.." correctly created and opened ")
    fd:close(); fd = nil
    
  else
    print("[Error] :  In try to open file")
  end
  return fd
end 


-- this function is used to store information line in file
function Save_Data_Line(Storingfile, PressureValue) 
  InformationLine = ""
  
  -- Get and append date-time to information line 
  tm = rtctime.epoch2cal(rtctime.get())
  print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
  InformationLine = InformationLine .. string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"])
  
  -- Append pressure value to information line 
  InformationLine = InformationLine .. " - " .. PressureValue 
  
  if fd then Storingfile.writeline(InformationLine) 
  else print("[Error] : In try to storing InformationLine ")
  end 
  
  return InformationLine
end 


function StartDataprocess(ProcessFile)

   Pr = GetPressureValue()
   Save_Data_Line(ProcessFile,Pr)
   
end 

-- This function is used to start reading and storing pressure values in log file 
function StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)

  file = Init_Logs(AcquisitionFileName)
  if(file ~= true ) then return 0 end 

  local timerID = 3
  tmr.alarm(timerID, DataAcquisitionPeriod, tmr.ALARM_SINGLE, function()
    StartDataprocess(file) 
  end) -- log Pressure every DataAcquisitionPeriod period 
  
  
end 


-- This function is used to stop data Acquisition process
function StopDataAcquisition()

    mytimer:Stop()
	fd:close(); fd = nil

end 


mytimer = tmr.create()
mytimer:register(10000, tmr.ALARM_AUTO, function() print("hey there") end)
mytimer:interval(3000) -- actually, 3 seconds is better!
mytimer:start()
