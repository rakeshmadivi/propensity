import sys
v=sys.version_info[0] #sys.python_version

if v < 3:
        from Tkinter import *
#elif "3.3" in v or "3.4" in v:
elif v >= 3:
        from tkinter import *
root=Tk("Text Editor")
root.mainloop()

