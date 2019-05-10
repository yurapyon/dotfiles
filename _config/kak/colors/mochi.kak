# mochi theme

# code
face global keyword    bright-green
face global value      yellow
face global number     bright-magenta
face global string     bright-magenta
face global operator   bright-blue
face global variable   bright-blue
face global comment    rgb:999999
face global identifier magenta
face global meta       bright-blue
face global attribute  bright-blue
face global type       bright-green
face global error      bright-red+br
face global todo       bright-yellow+bf
face global module     bright-magenta

# editor
face global Default default,default

face global PrimarySelection   white,green+g
face global SecondarySelection rgb:aaaaaa,green+g
face global PrimaryCursor      rgb:111111,bright-green+bfg
face global SecondaryCursor    black,rgb:aaaaaa+bfg
face global PrimaryCursorEol   black,red+fg
face global SecondaryCursorEol black,magenta+fg

face global LineNumbers      rgb:444444+b
face global LineNumberCursor yellow,default+b

face global MatchingChar  blue+rg
face global BufferPadding rgb:222222
face global Whitespace    default+f

face global Information black,yellow

# status line
face global Error          white,red+b
face global StatusLine     bright-green
face global StatusLineMode bright-yellow,default+b
face global StatusLineInfo white,default
face global StatusCursor   black,bright-green
face global Prompt         black,white

# menu
face global MenuBackground white,rgb:101010
face global MenuForeground bright-yellow,red+b

# -----

# Markup
face global title  bright-green+br
face global header bright-yellow+b
face global bold   red
face global italic yellow
face global mono   bright-green+b
face global block  bright-magenta
face global link   cyan
face global bullet cyan
face global list   yellow

# completion menu info
face global MenuInfo white,rgb:445599

# param=value, reg=value. ex: "ey
face global StatusLineValue green,default
