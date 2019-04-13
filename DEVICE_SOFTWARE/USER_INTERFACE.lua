-- ******** "USER_INTERFACE.LUA" ******** -- 
-- To do in this file --
-- STEP 1 : Create and configure TCP server  --
-- STEP 2 : Make an HTML user interface page  --
-- STEP 3 : Create lisner to send HTML page with collected date To user when he send request for device  --
require "DataProcess"

PressionValue = 0

print ("Start USER INTERFACE process ...")


 -- Start a simple http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
  conn:on("receive",function(conn,payload)
    --print(payload)
    PressionValue = adc.read(0)
    conn:send("<h1> welcome to Air Liquide device  </h1><br>")
    StopDataAcquisition()

    
    local _line 
    if file.open(AcquisitionFileName,"r") then 
      print("--FileView start")
      repeat 
        _line = file.readline()
        if (_line~=nil) then
          conn:send("<h1>"..string.sub(_line,1,-2).."  </h1>")
        end 
      until _line==nil 
      file.close() 
      print("--FileView done.") 
    else
      print("\r--FileView error: can't open file") 
    end 
    
    StartDataAcquisition(AcquisitionFileName, DataAcquisitionPeriod)
  end)
  conn:on("sent",function(conn) conn:close() end)
end)


