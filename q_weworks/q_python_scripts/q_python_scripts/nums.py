
'''
Obtaining user input.....Page 20-21
the line below was initially 6 lines, and then selecting all lines, then Ctrl+Shift+L, Del at end of first line will 
automatically join all of the lines together

days = ["1","2","3","4","5","6"]
----------------------------------------------------------------------------------------------------
-- MULTIPLE CURSORS--> CTRL+ALT+UP/DOWN
----------------------------------------------------------------------------------------------------
Return to single selection mode: Esc

Extend selection upward/downward at all carets: Ctrl + Alt + Up/Down

Extend selection leftward/rightward at all carets: Shift + Left/Right

Move all carets up/down/left/right, and clear selection: Up/Down/Left/Right

Undo the last selection motion: Ctrl + U

Add next occurrence of selected text to selection: Ctrl + D

Add all occurrences of the selected text to the selection: Alt + F3

Rotate between occurrences of selected text (single selection): Ctrl + F3 (reverse: Ctrl + Shift + F3)
Turn a single linear selection into a block selection, with a caret at the end of the selected text in each line: Ctrl + Shift + L

'''
import sys

def main(args):
	num = 3
	print num * 8 + 4 
	print num * ( 8 + 4 )


# output a string and a variable value
if __name__ == "__main__":
  	    main(sys.argv[1:])
