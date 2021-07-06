This is a bare-bones textbox implementation for [PICO-8](https://www.lexaloffle.com/pico-8.php). Part of its
implementation includes a 'printv' function which can be used to print custom
variable-width font, but this can be used by itself if desired.

The `test_printv.p8` and `test_tb.p8` files provide commented examples of how
to use this functionality.

The potential configuration options that can be passed into `queue_tb()` are
as follows:
- border-color:
    - The color to use for the border of the text box. 
    Defaults to 13.
- foreground-color:
    - The color to use for the foreground of the text box. 
    Defaults to 7.
- text-color:
    - The color to use for the text of the text box, as well as the
    continuation symbol shown when all text is visible. 
    Defaults to 1.
- at-bottom:
    - Whether or not the text box is anchored to the bottom of the screen.
    If false, the text box will be anchored to the top of the screen. 
    Defaults to true.
- speed:
    - Controls the speed at which the contents of the text box will be
    displayed. Higher values are slower; lower values are faster. 
    Defaults to 4.