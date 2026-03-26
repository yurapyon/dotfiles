local M = {}

local colors = require("mochi.palette")

M.setup = function()
  return {
    Normal     = { bg = colors.none },
    Comment    = { fg = colors.gray },
    Constant   = { fg = colors.magenta },
    Special    = { fg = colors.dark.magenta },
    Identifier = { fg = colors.cyan,                     bold = true },
    Statement  = { fg = colors.green },
    PreProc    = { fg = colors.blue },
    Type       = { fg = colors.cyan },
    Function   = { fg = colors.magenta,                  bold = true },
    Repeat     = { fg = colors.white },
    Operator   = { fg = colors.magenta },
    Ignore     = { fg = colors.black },
    Error      = { fg = colors.white, bg = colors.red },
    Todo       = { fg = colors.yellow,                   bold = true },
    Delimiter  = { fg = colors.gray },
    Search     = { fg = colors.blue,  bg = colors.white, bold = true },

    StatusLine   = { fg = colors.black, bg = colors.white },
    StatusLineNC = { fg = colors.black, bg = colors.gray },
    VertSplit    = { fg = colors.green, bg = colors.white },

    TabLineFill  = { fg = colors.black },
    TabLine      = { fg = colors.dark.gray, bg = colors.black },
    TabLineSel   = { fg = colors.yellow,    bg = colors.black },

    LineNr       = { fg = colors.grey,                     bold = true },
    CursorLineNr = { fg = colors.green, bg = colors.black, bold = true },

    cUserFunction        = { fg = colors.white },
    cUserFunctionPointer = { fg = colors.white },

    orthSymbol = { fg = colors.none },
    orthQuote  = { fg = colors.blue },
    orthDef    = { fg = colors.green },

    String         = { link = "Constant" },
    Character      = { link = "Constant" },
    Number         = { link = "Constant" },
    Boolean        = { link = "Constant" },
    Float          = { link = "Number" },
    Conditional    = { link = "Repeat" },
    Label          = { link = "Statement" },
    Keyword        = { link = "Statement" },
    Exception      = { link = "Statement" },
    Include        = { link = "PreProc" },
    Define         = { link = "PreProc" },
    Macro          = { link = "PreProc" },
    PreCondit      = { link = "PreProc" },
    StorageClass   = { link = "Type" },
    Structure      = { link = "Type" },
    Typedef        = { link = "Type" },
    Tag            = { link = "Special" },
    SpecialChar    = { link = "Special" },
    SpecialComment = { link = "Special" },
    Debug          = { link = "Special" },
  }
end

return M
