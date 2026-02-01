" let s:bg         = "#000000"
" let s:inactivebg = "#1c1c1c"
" let s:activebg   = "#303030"
" let s:inactivefg = "#aa9988"
" let s:fg         = "#ebdbb2"

let s:bg         = $BG
let s:fg         = $FG
let s:activebg   = $BG2
let s:inactivebg = $BG1
let s:inactivefg = $FG1

function s:hl(group, attrs)
    let l:command = "highlight" . " " . a:group
    for name in keys(a:attrs)
        let l:command .= " " . name . "=" . a:attrs[name]
    endfor
    execute l:command
endfunction

" Background color
hi! Normal ctermbg=NONE guibg=NONE
call s:hl("Normal", {"guibg": s:bg, "guifg": s:fg})

call s:hl("TabLineFill",   {"guibg": "NONE" })
call s:hl("TabLine",       {"guibg": "NONE", "guifg": s:inactivefg})
call s:hl("TabLineSel",    {"guibg": "NONE", "guifg": s:fg, "gui": "bold"})
call s:hl("TabLineSelNum", {"guibg": s:activebg, "guifg": s:fg})

" Statusline with Gruvbox colors
call s:hl("StatusLine",        {"guifg": s:activebg,   "guibg": s:activebg})
call s:hl("StatusLineNC",      {"guifg": s:inactivebg, "guibg": s:inactivebg})
call s:hl("StatusActive",      {"guibg": s:activebg,   "guifg": s:fg})
call s:hl("StatusActiveTitle", {"guibg": s:activebg,   "guifg": s:fg})
call s:hl("StatusInactive",    {"guibg": s:inactivebg, "guifg": s:inactivefg})

call s:hl("GitGutterAddInvisible",          {"guibg": "none"})
call s:hl("GitGutterChangeInvisible",       {"guibg": "none"})
call s:hl("GitGutterDeleteInvisible",       {"guibg": "none"})
call s:hl("GitGutterChangeDeleteInvisible", {"guibg": "none"})
call s:hl("GitGutterAdd",                   {"guibg": "none"})
call s:hl("GitGutterChange",                {"guibg": "none"})
call s:hl("GitGutterDelete",                {"guibg": "none"})
call s:hl("GitGutterChangeDelete",          {"guibg": "none"})
call s:hl("GitGutterAddLine",               {"guibg": "none"})
call s:hl("GitGutterChangeLine",            {"guibg": "none"})
call s:hl("GitGutterDeleteLine",            {"guibg": "none"})
call s:hl("GitGutterChangeDeleteLine",      {"guibg": "none"})
call s:hl("GitGutterAddLineNr",             {"guibg": "none"})
call s:hl("GitGutterChangeLineNr",          {"guibg": "none"})
call s:hl("GitGutterDeleteLineNr",          {"guibg": "none"})
call s:hl("GitGutterChangeDeleteLineNr",    {"guibg": "none"})
call s:hl("GitGutterAddIntraLine",          {"guibg": "none"})
call s:hl("GitGutterDeleteIntraLine",       {"guibg": "none"})

call s:hl("VertSplit",  {"guibg": "none", "guifg": s:inactivefg})
call s:hl("SignColumn", {"guibg": "none"})

call s:hl("Folded", {"guibg": "none"})
