pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
---
-- This is a cartridge showcasing the 'printv' functionality that can be 
-- directly run using PICO-8.
---

-- Using the 'printv' function only requires that you #include
-- the 'printv.p8' file in your cart.
#include printv.p8

function _draw()
    cls()
    printv("The brown fox jumped over the lazy\ndog...\n\n"..
        "\"To be, or not to be? That is \nthe question--\\\n"..
        "Whether \'tis nobler in the mind to\nsuffer\\\n"..
        "The slings and arrows of outrageous\nfortune,\\\n"..
        "Or to take arms against a sea of \ntroubles,\\\n"..
        "And, by opposing, end them? To die,\nto sleep...\"")       
end
