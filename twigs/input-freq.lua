--- input-freq
-- in1: oscillator input

--[[
    Crow has the capability to detect and process an incoming oscillator's freqency.
    This script sets up input[1] for detecting frequency.
    NOTE: frequency mode is only available on input[1], not input[2].
]]--

function init()

    -- this line sets up input[1] to freqency mode, updating every 0.01 seconds.
    input[1].mode('freq', 0.01 )

end

input[1].freq = function(frequency)

    -- here we print the input to the console, showing the raw freqency value.
    print("in1 freq: " .. frequency .. "hz")
    
    -- you can use the frequency reading inside this function for other purposes.
    -- a simple example is given in osc-to-v8.lua

end