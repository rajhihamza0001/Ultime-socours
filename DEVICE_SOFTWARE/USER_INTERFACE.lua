-- ******** "USER_INTERFACE.LUA" ******** -- 
-- To do in this file --
-- STEP 1 : Create and configure TCP server  --
-- STEP 2 : Make an HTML user interface page  --
-- STEP 3 : Create lisner to send HTML page with collected date To user when he send request for device  --

PressionValue = 0


function send(conn,payload)
    print(payload)
    PressionValue = adc.read(0)
    conn:send("<h1> welcome to Air Liquide device  </h1><br>")
    conn:send("<h1> pression value = ".. PressionValue  .."  </h1>")
end


print ("Start USER INTERFACE process ...")
 -- Start a simple http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
  conn:on("receive",function(conn,payload)
    print(payload)
    PressionValue = adc.read(0)
    conn:send("<h1> welcome to Air Liquide device  </h1><br>")
    conn:send("<h1> pression value = ".. PressionValue  .."  </h1>")
  end)
  conn:on("sent",function(conn) conn:close() end)
end)


