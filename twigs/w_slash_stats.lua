--- w_slash_stats.lua 
-- continually pull stats for one of the w/ modes.

-- uncomment one of the mode options.
mode = "del"
-- mode = "syn"
-- mode = "tape"

--- run params
call_delay = 0.0015
loop_delay = 0.3

function pull_del()
    local del_params = {'feedback', "mix", "filter", "freeze", "time", "rate", "freq", "mod_rate", "mod_amount"}

    while true do

        print("w/del params")
        print("---")

        for k,v in del_params do
            ii.wdel.get(v)
            retrieve_value("del")
            clock.sleep(call_delay)
        end
        
        clock.sleep(loop_delay)
    end
end

function pull_syn()
    local syn_params = {"ar_mode", "curve", "ramp", "fm_index", "fm_env", "lpg_time", "lpg_symmetry", "voices", "fm_ratio"}

    while true do

        print("w/syn params")
        print("---")

        for k,v in syn_params do
            ii.wsyn.get(v)
            retrieve_value("syn")
            clock.sleep(call_delay)
        end

        --since these have a second arg to the call, i'm just doing them separately
        ii.wsyn.get( 'patch', 1 )
        retrieve_value("syn")
        clock.sleep(call_delay)
        ii.wsyn.get( 'patch', 2 )
        retrieve_value("syn")
        clock.sleep(call_delay)


        clock.sleep(loop_delay)
    end
end

function pull_tape()

    local tape_params = {'record', "play", "freq", "erase_strength", "monitor_level", "rec_level", "echo_mode", "loop_scale", "timestamp", "speed", "loop_start", "loop_end"}
    while true do

        print("w/tape params")
        print("---")

        for k,v in tape_params do
            ii.wtape.get(v)
            retrieve_value("tape")
            clock.sleep(call_delay)
        end

        clock.sleep(loop_delay)
    end
end


function retrieve_value(retrieve_mode)
    if retrieve_mode == "del" do
        ii.wdel.event = function(e, value)
            print("w/" .. retrieve_mode .. " " .. e.name .. " = " .. value)
        end
    else if retrieve_mode == "syn" do
        ii.wsyn.event = function(e, value)
            print("w/" .. retrieve_mode .. " " .. e.name .. " = " .. value)
        end
    else if retrieve_mode == "tape" do
        ii.wtape.event = function(e, value)
            print("w/" .. retrieve_mode .. " " .. e.name .. " = " .. value)
        end
    end
end

function init()
    if mode=="del" do
        clock.run(pull_del)
    else if mode=="syn" do
        clock.run(pull_syn)
    else if mode == "tape" do 
        clock.run(pull_tape)
    end
end

