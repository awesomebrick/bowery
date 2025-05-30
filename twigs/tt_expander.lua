--- tt_expander.lua
-- dan b.

--[[
    Crow, when connected to Teletype over i2c, can act as an expander for Teletype. Not only can you manually set outputs and return inputs using Teletype, but you can also call functions or queries stored in advance on Crow's uploaded user script to be run with a command from Teletype.

    This script offers framework for setting up these function calls and queries.
]]--

function init()
    ---
    ---
end

--- CALLS ---
-- these are functions to be run, that can be called with values from Teletype.

-- called from teletype with:
-- CROW.C1 x
ii.self.call1 = function(x)
    -- run code in here.
end

-- called from teletype with:
-- CROW.C2 x y
ii.self.call2 = function(x, y)
    -- run code in here.
end

-- called from teletype with:
-- CROW.C3 x y z
ii.self.call3 = function(x, y, z)
    -- run code in here.
end

-- called from teletype with:
-- CROW.C4 x y z t
ii.self.call4 = function(x, y, z, t)
    -- run code in here.
end


--- QUERIES ---
-- These are functions which that are like calls, but will return a value to Teletype when run.
-- All of these queries are set up to return v in the template, but you can change this value to whatever you wish.


-- queried from teletype with:
-- CROW.Q0
ii.self.query0 = function()
    v = 0
    -- run code, or assign v to whatever script variable, in here.
    return v
end

-- queried from teletype with:
-- CROW.Q1 x
ii.self.query1 = function(x)
    v = 1
    -- run code, or assign v to whatever script variable, in here.
    return v
end

-- queried from teletype with:
-- CROW.Q2 x y
ii.self.query2 = function(x, y)
    v = 2
    -- run code, or assign v to whatever script variable, in here.
    return v
end

-- queried from teletype with:
-- CROW.Q3 x y z
ii.self.query3 = function(x, y, z)
    v = 3
    -- run code, or assign v to whatever script variable, in here.
    return v
end
