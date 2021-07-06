pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
---
-- This is a cartridge showcasing the textbox functionality that can be 
-- directly run using PICO-8.
---

-- Both 'tb.p8' and 'printv.p8' should be included
#include printv.p8
#include tb.p8

function _update()
    if (btnp(5) and #tb_n < 1) then 
        -- To create a textbox, call tb_queue(s,o). Here, 's' is a string
        -- array containing the lines of text to be displayed in the textbox,
        -- and 'o' is a table containing the desired display options. Check
        -- the readme for more details regarding potential options.
        tb_queue(split("Hello, world;%it's nice to meet you!%:)","%"), {atbot=false,bg=9})
        tb_queue{"How's the weather today?"}
    end
    -- Next, include tb_run(x) in the main _update() function, where 'x' is 
    -- a value indicating that the current textbox should be closed. If there
    -- is another textbox that has been queued, that one will be displayed.
    tb_run(btnp(5))
end

function _draw()
    cls()
    -- The final step is to include a call to tb_draw() in the main _draw() 
    -- function.
    tb_draw()
end
