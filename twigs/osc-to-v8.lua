--- osc-to-v8
-- in1: oscillator input
-- out1: v/8 output of detected frequency

--[[
    Crow has the capability to process an incoming oscillator's freqency.
    There is also a built in function to convert a frequency to its equivalent v/8 value.
    
    This script displays the functionality for both of these features. input[1] takes in an oscillator, 
    processes it and returns a Hz value for frequency, then uses the built in hztovolts() function to generate a v/8 CV to drive another oscillator.
    This is useful for if you have an uncontrolled audio source that you want to tune an extra oscillator to, as it's playing. 
    e.g. someone singing on a mic, recorded audio, guitar input, etc.
]]--

input[1].freq = function(frequency)

    -- here we print the value to the console, showing the raw freqency value.
    print("in1 freq: " .. frequency .. "hz")
   
    -- and here, we pass our frequency value from input1, to output1. 
    -- hztovolts() is a function that takes an input of a frequency value, 
    -- and returns the volt value of that frequency.
    output[1].volts = hztovolts(frequency)

end

function init()

    -- this line sets up input[1] to freqency mode.
    input[1].mode('freq', 0.01 )

end

