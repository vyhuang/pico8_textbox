pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
-- These variables are used internally and should not be modified.
tb_n={}
tb_d={bg=13,fg=7,txt=1,atbot=true,speed=4}
-- This function is used internally and should not be called directly.
function tb_update()
 local tb_o,tb_c = #tb_box.str * 9
 tb_top,tb_bot = tb_box.atbot and 124 - tb_o or 0, tb_box.atbot and 127 or tb_o + 4
 tb_fbot,tb_mask = tb_bot - 1, tb_o + 2

 yield()yield()yield()
 while tb_mask > 1 do
  tb_mask -= 1
  for i=1,tb_box.speed,2 do yield() end
 end

 for i=1,9 do yield() end
 tb_done = true

 while not tb_c do tb_c = yield() end
 yield()yield()
end

---- 
-- Queues up a text box for run_tb() to use.
-- @param str table: An 'array' of strings to be displayed in the textbox.
-- @param options table: A set of options that can be set for the textbox.
function tb_queue(str, options)
 local new_box = options or {}
 new_box.str = str
 -- initialize box values
 for k,v in pairs(tb_d) do
  if (new_box[k] == nil) new_box[k] = v
 end
 add(tb_n, new_box)
end

---
-- Creates, runs, and cleans up the coroutine used to update textbox values.
-- Should be included in _update().
-- @param tb_c boolean: Whether the current text box should be closed. This
--          is ignored if the current text has not been fully displayed.
function tb_run(tb_c)
 if not tb_cor then
  if #tb_n > 0 then
   tb_box,tb_cor = tb_n[1],cocreate(tb_update)
   coresume(tb_cor)
  end
 elseif costatus(tb_cor) != "dead" then
  coresume(tb_cor, tb_c)
 else
  deli(tb_n, 1)
  tb_done,tb_box,tb_mask,tb_cor = false
 end
end

---
--  Renders the current textbox stored in tb_box. Should be included in _draw()
function tb_draw()
 if tb_box and tb_mask then
  rectfill(0, tb_top, 128, tb_bot, tb_box.bg)
  rectfill(1, tb_top + 1, 124, tb_fbot, tb_box.fg)
  -- The 'printv()' call can be swapped out for 'print()', but doing so
  -- will need adjusting 'tb_o' in 'tb_update' as well as the y-value
  -- in the call below.
  for k,v in pairs(tb_box.str) do
   printv(v, 4, tb_top + 3 + (k-1)*9, tb_box.txt)
  end
  if (tb_mask > 2) rectfill(1, tb_bot-tb_mask, 124, tb_fbot, tb_box.fg)
  if (tb_done) print(#tb_n > 1 and "…" or "◆", 117, tb_bot-5, tb_box.txt)
 end
end
