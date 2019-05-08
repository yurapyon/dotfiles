# http://common-lisp.net
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](lisp) %{
    set-option buffer filetype lisp
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=lisp %{
    require-module lisp

    hook window InsertChar \n -group lisp-indent lisp-simple-indent
    set-option buffer extra_word_chars ':' '<' '>' '='

    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window lisp-.+ }
}

hook -group lisp-highlight global WinSetOption filetype=lisp %{
    add-highlighter window/lisp ref lisp
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/lisp }
}

provide-module -override lisp %{

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/lisp regions
add-highlighter shared/lisp/code default-region group
add-highlighter shared/lisp/string  region '"' (?<!\\)(\\\\)*" fill string
add-highlighter shared/lisp/comment region ';' '$'             fill comment
add-highlighter shared/lisp/comment-block region "#\|" "\|#" fill comment

add-highlighter shared/lisp/code/ regex (?<=[\s()])[0-9]+\.*[0-9]*(?=[\s()]) 0:number

add-highlighter shared/lisp/code/ regex (?<=[\s()])(nil|t)(?=[\s()]) 0:value
add-highlighter shared/lisp/code/ regex (?<=[\s()])((:|&|\Q#\E\\)[^\s()]+)(?=[\s()]) 0:value

add-highlighter shared/lisp/code/ regex \(|\) 0:comment

add-highlighter shared/lisp/code/ regex (?<=[\s()])(defun|defmacro|defpackage|defgeneric|defmethod|defstruct|defclass|in-package|defvar|defparameter)(?=[\s()]) 0:keyword
add-highlighter shared/lisp/code/ regex (?<=[\s()])(if|cond|when|case)(?=[\s()]) 0:keyword
add-highlighter shared/lisp/code/ regex (?<=[\s()])(lambda|let|let\*|progn|map|loop)(?=[\s()]) 0:keyword
add-highlighter shared/lisp/code/ regex (?<=[\s()])(null|consp)(?=[\s()]) 0:keyword
add-highlighter shared/lisp/code/ regex (?<=[\s()])(error)(?=[\s()]) 0:keyword
# add-highlighter shared/lisp/code/ regex (?<=[\s()])(or|and|not)(?=[\s()]) 0:keyword

add-highlighter shared/lisp/code/ regex (?<=[\s()])(<|>|<=|=|>=|/=|\+|-|\*|/)(?=[\s()]) 0:operator

define-command -hidden lisp-simple-indent %{
    try %{ execute-keys -draft ';K<a-&>' }
}

# add-highlighter shared/lisp/code/ regex [\*\+][a-zA-Z][\w!$%&*+./:<=>?@^_~-]*[\*\+] 0:variable
# add-highlighter shared/lisp/code/ regex (#?(['`:]|,@?))+\b[a-zA-Z][\w!$%&*+./:<=>?@^_~-]* 0:variable
# add-highlighter shared/lisp/code/ regex (\b\d+)?\.\d+([eEsSfFdDlL]\d+)?\b 0:value
# add-highlighter shared/lisp/code/ regex [\s]\d+[\s] 0:value

}
