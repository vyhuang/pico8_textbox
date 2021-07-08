This is a bare-bones textbox implementation for [PICO-8](https://www.lexaloffle.com/pico-8.php). Part of its implementation includes a 'printv' function which can be used to print custom variable-width font, but 'printv' can be used by itself if desired. 

![test_printv output - shows sample text](/resources/test_printv.png) ![test_tb output - shows two text boxes in succession](/resources/test_tb.gif)

The PNG file used for the custom font can be found in 'resources/font.png'.

![font.png - the image file used to generate the font snippet](/resources/font.png)

NOTE: The font deliberately uses uppercase letters for characters 0x41-0x5a, and lowercase letters for 0x61-0x7a. Essentially, the case will be reversed from that seen in the PICO-8 editor itself, but should match the case used when editing a file in an external editor. If you wish to swap the cases back around, then you can edit 'font.png' and then load the 'font_snippet' generator written by zep. Then replace the first line of printv.p8 with the new snippet. Make sure to keep the positions of the symbols the same.

The dimensions of the font are as follows:
char_width=6
char_width2=8
char_height=9

I've made efforts to limit the amount of tokens used, but I've not fully minified the cartridges to reduce character count. As of 7/8/21, the INFO command from PICO-8 reads as follows:
printv:
- 126 tokens
- 3311 characters

tb.p8:
- 278 tokens
- 2160 characters

The `test_printv.p8` and `test_tb.p8` files provide commented examples of how to use this functionality.

The potential configuration options that can be passed into `queue_tb()` are
as follows:
- border-color:
    - The color to use for the border of the text box. Defaults to 13.
- foreground-color:
    - The color to use for the foreground of the text box. Defaults to 7.
- text-color:
    - The color to use for the text of the text box, as well as the continuation symbol shown when all text is visible. Defaults to 1.
- at-bottom:
    - Whether or not the text box is anchored to the bottom of the screen.
    If false, the text box will be anchored to the top of the screen. Defaults to true.
- speed:
    - Controls the speed at which the contents of the text box will be
    displayed. Higher values are slower; lower values are faster. Defaults to 4.
