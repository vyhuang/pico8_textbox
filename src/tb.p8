pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- These variables are used internally and should not be modified.
tb_next={}
tb_default={bg=13,fg=7,txt=1,atBot=true,speed=4,delay=9}
-- This function is used internally and should not be called directly.
function tb_update()
    tb_close,tb_offset = false, #tb_box.str * 9
    tb_top,tb_bot = tb_box.atBot and 124 - tb_offset or 0, tb_box.atBot and 127 or tb_offset + 4
    tb_fgBot,tb_mask = tb_bot - 1, tb_offset + 2

    for i=0,3 do yield() end

    while tb_mask > 1 do
        tb_mask -= 1
        for i=1,tb_box.speed,2 do yield() end
    end

    for i=1,tb_box.delay do yield() end
    tb_done = true

    while not tb_close do tb_close = yield() end
    for i=0,2 do yield() end
end

---- 
-- Queues up a text box for run_tb() to use.
-- @param str table: The strings to be displayed in the textbox.
-- @param options table: A set of options that can be set for the textbox.
function tb_queue(str, options)
    tb_newBox = options or {}
    tb_newBox.str = str
    -- initialize box values
    for k,v in pairs(tb_default) do
        if (tb_newBox[k] == nil) tb_newBox[k] = v
    end
    add(tb_next, tb_newBox)
end

---
-- Creates, runs, and cleans up the coroutine used to update textbox values.
-- Should be included in _update().
-- @param tb_close boolean: Whether the current text box should be closed. This
--          is ignored if the current text has not been fully displayed.
function tb_run(tb_close)
    if not tb_coroutine then
        if #tb_next > 0 then
            tb_box,tb_coroutine = tb_next[1],cocreate(tb_update)
            coresume(tb_coroutine)
        end
    elseif costatus(tb_coroutine) != "dead" then
        coresume(tb_coroutine, tb_close)
    else
        deli(tb_next, 1)
        tb_done,tb_box,tb_mask,tb_coroutine = false
    end
end

---
--  Renders the current textbox stored in tb_box. Should be included in _draw()
function tb_draw()
    if tb_box and tb_mask then
        rectfill(0, tb_top, 128, tb_bot, tb_box.bg)
        rectfill(1, tb_top + 1, 124, tb_fgBot, tb_box.fg)
        for k,v in pairs(tb_box.str) do
            -- If desired, the 'printv' function can be swapped out
            -- for the regular 'print' function, but this will require
            -- changing the values used for the 'offset' in tb_update()
            -- as well as here
            printv(v, 4, tb_top + 3 + (k-1)*9, tb_box.txt)
        end
        if (tb_mask > 2) rectfill(1, tb_bot-tb_mask, 124, tb_fgBot, tb_box.fg)
        if (tb_done) print(#tb_next > 1 and "…" or "❎", 117, tb_bot-5, tb_box.txt)
    end
end