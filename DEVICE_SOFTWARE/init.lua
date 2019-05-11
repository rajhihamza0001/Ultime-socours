-- ******** "init.LUA" ******** -- 
-- To do in this file --
-- STEP 1 : Init system and variable To use --
require "Device_Config"

print("Device is started ...")

files = file.list()
if files[AcquisitionFileName] then
    file.remove(AcquisitionFileName)
    node.restart()
end

dofile("main.lua")

-- Add modification to test git 
