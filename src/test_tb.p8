pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- In addition to including 'tb.p8', 'printv.p8' should be included as well.
#include printv.p8
#include tb.p8

function _update()
    if (btnp(5) and #tb_next < 1) then 
        -- To create a textbox, simply call tb_queue(string_array, options)
        -- Further details concerning the potential options is covered in
        -- tb.p8
        tb_queue(split("Hello, world;%it's nice to meet you!%:)","%"), {atBot=false,bg=9})
        tb_queue{"How's the weather today?"}
    end
    -- tb_run(x) should be included in the main _update() function. 'x' is
    -- expected to be a boolean that should be true when the player wishes to
    -- advance to the next chunk of dialogue.
    tb_run(btnp(5))
end

function _draw()
    cls()
    -- tb_draw() should be included in the main _draw() function. No further
    -- actions need to be taken.
    tb_draw()
end
