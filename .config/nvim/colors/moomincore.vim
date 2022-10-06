" im gay

hi clear Normal
hi clear

if exists("syntax_on")
  syntax reset
endif

set background=dark
let colors_name = "moomincore"

" recommended terminal colors:
hi color0  guifg=#24242F
hi color1  guifg=#A2003F
hi color2  guifg=#00FF99
hi color3  guifg=#FBBA56
hi color4  guifg=#593FD7
hi color5  guifg=#DC8CC3
hi color6  guifg=#5BCEFA
hi color7  guifg=#AAA6E1
hi color8  guifg=#766D7F
hi color9  guifg=#FC1783
hi color10 guifg=#57236D
hi color11 guifg=#F5A9B8
hi color12 guifg=#00B3B3
hi color13 guifg=#735787
hi color14 guifg=#007266
hi color15 guifg=#FFFFFF
hi color16 guifg=#000000
let g:terminal_color_0 =  '#24242F'
let g:terminal_color_1 =  '#A2003F'
let g:terminal_color_2 =  '#00FF99'
let g:terminal_color_3 =  '#FBBA56'
let g:terminal_color_4 =  '#593FD7'
let g:terminal_color_5 =  '#DC8CC3'
let g:terminal_color_6 =  '#5BCEFA'
let g:terminal_color_7 =  '#AAA6E1'
let g:terminal_color_8 =  '#766D7F'
let g:terminal_color_9 =  '#FC1783'
let g:terminal_color_10 = '#57236D'
let g:terminal_color_11 = '#F5A9B8'
let g:terminal_color_12 = '#00B3B3'
let g:terminal_color_13 = '#735787'
let g:terminal_color_14 = '#007266'
let g:terminal_color_15 = '#FFFFFF'
let g:terminal_color_16 = '#000000'
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

hi Cursor         guifg=#0B0B0C           guibg=#DEFFFF
hi iCursor        guifg=NONE              guibg=#00B3B3
" hi CursorLineNr        ctermfg=246  guifg=#766D7F  ctermbg=NONE guibg=NONE
" hi CursorLine     guifg=none              guibg=#002943

hi Boolean             ctermfg=198  guifg=#FF0087                             cterm=Bold    gui=Bold
hi Comment             ctermfg=14   guifg=#735787
hi Conditional         ctermfg=11   guifg=#FC1783
hi Constant            ctermfg=116  guifg=#87D7D7
hi Folded              ctermfg=255  guifg=#FFFFFF  ctermbg=234  guibg=#1C1C1D
hi Function            ctermfg=6    guifg=#5BCEFA                             cterm=Bold    gui=Bold
hi Label               ctermfg=5    guifg=#DC8CC3
hi LineNr              ctermfg=238  guifg=#444444  ctermbg=NONE guibg=NONE    cterm=NONE    gui=NONE
" guibg is VERY important
hi Normal              ctermfg=255  guifg=#FFFFFF  ctermbg=NONE guibg=#24242F cterm=NONE    gui=NONE
hi Number              ctermfg=203  guifg=#FF5F5F
hi PreProc             ctermfg=12   guifg=#00B3B3
hi SignColumn                                      ctermbg=NONE guibg=NONE
hi Special             ctermfg=7    guifg=#AAA6E1
hi Statement           ctermfg=6    guifg=#5BCEFA                             cterm=NONE    gui=NONE
hi String              ctermfg=13   guifg=#00FF99
hi TabLine             ctermfg=14   guifg=#735787  ctermbg=232  guibg=#141415 cterm=NONE    gui=NONE
hi TabLineFill         ctermfg=16   guifg=#000000  ctermbg=232  guibg=#141415 cterm=NONE    gui=NONE
hi TabLineSel          ctermfg=6    guifg=#5BCEFA  ctermbg=232  guibg=#141415 cterm=NONE    gui=NONE
hi Type                ctermfg=4    guifg=#593FD7
hi pythonBuiltin       ctermfg=11   guifg=#00B3B3                             cterm=Bold    gui=Bold
hi pythonStatement     ctermfg=6    guifg=#5BCEFA
hi Pmenu               ctermfg=11   guifg=#FC1783  ctermbg=233  guibg=#0B0B0C cterm=NONE    gui=NONE
hi PmenuSel            ctermfg=0    guifg=#24242F  ctermbg=6    guibg=#5BCEFA
hi WildMenu            ctermfg=0    guifg=#24242F  ctermbg=6    guibg=#5BCEFA cterm=NONE    gui=NONE
hi StatusLine          ctermfg=0    guifg=#24242F  ctermbg=11   guibg=#FC1783
hi NonText             ctermfg=7    guifg=#AAA6E1                             cterm=NONE    gui=NONE
hi Search              ctermfg=16   guifg=#000000  ctermbg=3    guibg=#FBBA56 cterm=NONE
hi Error               ctermfg=9    guifg=#F5A9B8  ctermbg=NONE guibg=NONE    cterm=undercurl gui=undercurl
hi cType               ctermfg=2    guifg=#007266
" vim/neovim currently don't support configuring individual underline/curl
" colors
hi SpellBad            ctermfg=NONE                ctermbg=NONE               cterm=undercurl
hi MatchParen          ctermfg=3                   ctermbg=NONE               cterm=bold,underline

hi! link SpellCap SpellBad
hi! link pythonBuiltin Function
hi! link Identifier Normal
" hi! link SpecialChar Normal
hi! link Repeat Conditional
" hi! link pythonException pythonBuiltin
" hi! link pythonFunction  Function

" recommended terminal colors (old):
" hi color0  guifg=#00001A ctermfg=0
" hi color1  guifg=#A2003F ctermfg=1
" hi color2  guifg=#007266 ctermfg=2
" hi color3  guifg=#FBBA56 ctermfg=3
" hi color4  guifg=#00C777 ctermfg=4
" hi color5  guifg=#AAA6E1 ctermfg=5
" hi color6  guifg=#74D7EC ctermfg=6
" hi color7  guifg=#DFA8FF ctermfg=7
" hi color8  guifg=#766D7F ctermfg=8
" hi color9  guifg=#F62BED ctermfg=9
" hi color10 guifg=#FC1783 ctermfg=10
" hi color11 guifg=#F5A2BB ctermfg=11
" hi color12 guifg=#00B3B3 ctermfg=12
" hi color13 guifg=#FF6666 ctermfg=13
" hi color14 guifg=#735787 ctermfg=14
" hi color15 guifg=#FFFFFF ctermfg=15
"
