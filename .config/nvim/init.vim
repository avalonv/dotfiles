" i have autism
"******** SETTINGS ******** {{{
" vim:foldenable:foldmethod=marker

" quite a few of these are set by default, but I prefer to have them here anyways
filetype plugin indent on                               " enable plugins for file type detection
syntax on                                               " use syntax highlighting
set nocompatible                                        " don't be annoying
set backspace=indent,eol,start                          " allow backspacing over everything in insert mode.
set tabpagemax=30                                       " increase max number of tabs (default is 10)
set history=1000                                        " lots of command line history
set wildmenu
" set wildmode=longest,list,full                          " bash like autocompletion (superseded by popup menu)
set wildignorecase                                      " ignore case when completing file names
set wildignore=*.o,*.obj,*.out                          " ignore the following types when autocompleting filenames
set number                                              " show line numbers
set tabstop=8                                           " input 4 spaces when <tab> is pressed.
set shiftwidth=4                                        " CTRL-V <tab> to insert a real tab.
set expandtab
set smarttab
set hlsearch                                            " highlight matches while searching
set incsearch
set mouse=nvi                                           " enable mouse support in visual and insert modes
set ttimeout                                            " time out for key codes
set ttimeoutlen=50                                      " wait up to 100ms after Esc for special key
set timeoutlen=700                                      " wait up to 700ms to complete a sequence of commands
set display=truncate                                    " show @@@ in the last line if it is truncated.
set background=dark                                     " don't hurt my eyes
set ignorecase                                          " ignore case in searches
set smartcase                                           " if pattern contains upper case letter, it is case sensitive
set title                                               " Set the window title
set titlestring=weiss:\ %F\ %r%m
set scrolloff=5                                         " scroll offset
set nrformats-=octal                                    " do not recognize octal numbers for Ctrl-A and Ctrl-X
set whichwrap+=<,>,h,l,[,]                              " go up/down when you reach the start/end of the current line
set list                                                " explicitly display trailing characters
set listchars=tab:>·,trail:␣,extends:>,precedes:<,nbsp:+
set guicursor=n-v-c:blinkwait999-blinkon650-blinkoff450 " cursor config. this one you're gonna wanna read the docs for
set guicursor+=n-v-c:block-Cursor                       " the appropiate highlight groups are in the colors file
set guicursor+=i:blinkwait100-blinkon350-blinkoff350
set guicursor+=i:ver30-iCursor
set nocursorline                                        " highlight the current line (disabled bc hogs resources)
set autoindent                                          " autoindent (duh)
set autoread                                            " ask to update file when it detects edits done outside of vim
set autochdir                                           " auto change working directory
" set hidden                                              " don't ask to save buffers when closing them, hide them
set splitright                                          " open new windows on the right by default
set nofoldenable                                        " initially disable folding
set foldlevel=0                                         " Autofold everything by default
set foldmethod=marker
set foldnestmax=1                                       " only fold outer functions
"set lazyredraw                                          " don't redraw screen while macros are running
set confirm                                             " confirm quit
set numberwidth=3                                       " smaller line number width
set complete=.,w,b,u,t,spell                            " enable english word suggestions when 'spell is on
set updatetime=300                                      " smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                                        " don't give |ins-completion-menu| messages.
set relativenumber
set statusline=\ %n\ %F\ %r\ %Y
set belloff=all
set spellsuggest=15                                     " never give more than 15 spell suggestions
set showmode
set ruler
set inccommand=                                         " the default breaks coc linting under certain circumstances
set clipboard+=unnamedplus                              " copy to system clipboard by default

if has("nvim-0.3")
    set signcolumn=yes                                  " always show gutter on the left
endif
if has("nvim-0.4")
    set wildoptions=pum                                 " use ins-completion like pop menu for wildmenu
endif

let c_comment_strings=1                                 " show strings inside C comments
let python_highlight_all=1                              " use full python syntax highlighting
"}}}
"********* COLORS ********* {{{
set termguicolors " still experimenting
" see :h group-name
" also see https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" for gui colors
" <C-w>f ~/.config/nvim/colors/moomincore.vim
if !empty(glob("~/.config/nvim/colors/moomincore.vim"))
    colorscheme moomincore
endif

hi clear CursorLine " highlight ONLY the linenr
" hi clear SpellBad

hi CursorLine ctermbg=233 ctermfg=NONE
hi VertSplit ctermfg=6 ctermbg=0 cterm=NONE

" syntax highlight "+,%,=,<>,-,^,*" etc in certain files
" https://stackoverflow.com/a/18943408/8225672
 " autocmd FileType python call <SID>def_base_syntax()
 " function! s:def_base_syntax()
 "     syntax match commonOperator "\(+\|!\|%\|=\|/\|<\|>\|-\|\^\|\*\)"
 "     hi link commonOperator Statement
 "     hi link baseDelimiter Statement
 "     " syntax match baseDelimiter "\(\[\|\]\|\.\|,\)"
 "     " syntax match myParens "\((\|)\)"
 "     " hi link myParens Special
 " endfunction
" }}}
"******** PLUGINS ********* {{{
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'kevinhwang91/rnvimr' "{{{
" floating replacement for Plug 'rafaqz/ranger.vim'

" use sane colors
hi link RnvimrNormal Normal

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Replace `$EDITOR` candidate with this command to open the selected file
let g:rnvimr_edit_cmd = 'drop'

" Disable a border for floating window
let g:rnvimr_draw_border = 0

" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1

" Change the border's color
" let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 30

" Draw border with both
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']

" Link CursorLine into RnvimrNormal highlight in the Floating window
" highlight link RnvimrNormal CursorLine

" nnoremap <silent> <M-o> :RnvimrToggle<CR>
" tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

" Resize floating window by all preset layouts
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>

" Resize floating window by special preset layouts
tnoremap <silent> <M-l> <C-\><C-n>:RnvimrResize 1,8,9,11,5<CR>

" Resize floating window by single preset layout
tnoremap <silent> <M-y> <C-\><C-n>:RnvimrResize 6<CR>

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Only use initial preset layout
" let g:rnvimr_presets = [{}]
"}}}
Plug 'vim-airline/vim-airline' "{{{
set noshowmode
set noruler " no gods no masters
" set laststatus=0
" set statusline=\ %n\ %F\ %r\ %Y
" let g:airline_symbols_ascii = 1 " no fancy symbols
let g:airline#extensions#disable_rtp_load = 1
let g:airline_powerline_fonts = 1
" let g:airline_extensions = ['whitespace','tabline','coc']
let g:airline_extensions = ['whitespace','coc'] " disable tablien
let g:airline#extensions#tabline#buffers_label = 'B:'
let g:airline#extensions#tabline#tabs_label = 'T:'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_close_button = 1
let g:airline_section_x = ''
let g:airline_section_y = '%y'
" let g:airline_section_c = '%-0.15{expand("%:p:h")}/%t %{SyntasticStatuslineFlag()}'
" let g:airline_section_x = '%y %z'
let g:airline#extensions#tabline#enabled = 0

" noremap <silent> <Leader>A :AirlineToggle<cr>
"<- airline themes ->
Plug 'vim-airline/vim-airline-themes'
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'COMM',
    \ 'i'      : 'INSE',
    \ 'ic'     : 'IN-C',
    \ 'ix'     : 'INSE',
    \ 'n'      : 'NORM',
    \ 'multi'  : 'NORM',
    \ 'ni'     : 'NORM',
    \ 'no'     : 'NORM',
    \ 'R'      : 'REPL',
    \ 'Rv'     : 'REPL',
    \ 's'      : 'REPL',
    \ 'S'      : 'REPL',
    \ '^S'     : 'REPL',
    \ 't'      : 'Term',
    \ 'v'      : 'VISU',
    \ 'V'      : 'VI-L',
    \ ''     : 'VI-B',
    \ }

" let g:airline_theme_patch_func = 'AirlineThemePatch'
" function! AirlineThemePatch(palette)
"   if g:airline_theme == 'serene'
"     for colors in values(a:palette.inactive)
"       let colors[3] = 245
"     endfor
"   endif
" endfunction

if !empty(glob("~/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes/myserene.vim"))
  let g:airline_theme = 'mylucius'
else
  let g:airline_theme = 'lucius'
endif
"}}}
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } "{{{
Plug 'tiagovla/scope.nvim' " give tab has its own scope of buffers
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
"}}}
"Plug 'kyazdani42/nvim-tree.lua' "{{{
""}}}
Plug 'tpope/vim-surround' "{{{
"}}}
Plug 'tpope/vim-commentary' "{{{
"}}}
Plug 'Yggdroot/indentLine' "{{{
" Plug 'lukas-reineke/indent-blankline.nvim'
let g:indentLine_char = '│'
autocmd FileType man,help IndentLinesDisable
autocmd TermOpen * IndentLinesDisable
" append to ~/.config/nvim/plugged/ranger.vim/plugin/ranger.vim:
"  setlocal norelativenumber
"  setlocal nonumber
"  setlocal signcolumn=no
"  IndentLinesDisable
"}}}
Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
" this bad boy breaks every week
let g:coc_global_extensions = [
            \  'coc-emoji', 'coc-eslint', 'coc-prettier',
            \  'coc-eslint', 'coc-css', 'coc-pyright',
            \  'coc-pairs', 'coc-json', 'coc-yaml']

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" color stuff
hi CocMenuSel ctermbg=8 guibg=#766D7F

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" You may want to set '"suggest.noselect": true' in coc-settings.json if you don't plan
" to use <CR> to confirm selections.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ignore the above, use TAB to select, <C-p> and <C-n> to navigate up/down
" https://github.com/neoclide/coc.nvim/issues/4043
" inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>d  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" show yank history
" nnoremap <silent> "" :<C-u>CocList -A --normal yank<cr>
"}}}
Plug 'tpope/vim-repeat' "{{{
"}}}
Plug 'lilydjwg/colorizer' "{{{
"}}}
Plug 'tpope/vim-eunuch' "{{{
"}}}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "{{{
au BufEnter github.com_*.txt set filetype=markdown
" let fc['.*'] = { 'takeover': 'never' }
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
if exists('g:started_by_firenvim')
    set laststatus=0
    set showtabline=0
    set spell
    set norelativenumber
    set nonumber
    set signcolumn=no
    noremap j gj
    noremap k gk
    noremap 0 g0
    noremap $ g$
endif
"}}}
call plug#end()
"}}}
"*** FUNCTIONS/COMMANDS *** {{{
" https://vi.stackexchange.com/a/456/1111
function! RmTrailing()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" delete buffer if it's the only thing on the window
" close window otherwise
" original: https://vi.stackexchange.com/a/22777/22000
function! BDeleteIfSingle() abort
  if winnr('$') > 1 || getline(1, '$') == [''] && bufname('%') == ''
    quit
  else
    bdelete
  endif
endfunction

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

if !has("nvim")
    command! Config edit ~/.vimrc
else
    command! Config edit ~/.config/nvim/init.vim
endif

" removes... wait for it... trailing (whitespaces)
command! AvalonRmTrailing call RmTrailing()

" Capitalizes most things.
command! AvalonCapitalize %s:\<i\(\>\|m\>\)\@=:\U&:gie | %s:\<Im\>:I'm:gie | %s:\(^\|[\.?!] \)\a:\U&:gie | nohlsearch

" Tip: use 'Ctrl+R %' to get just the filename, also works in insert mode
command! AvalonYankDir silent let @" = expand("%:h") | let @+ = @"
command! AvalonYankFullPath silent let @" = expand('%:p') | let @+ = @"

" stolen from justinmk
command! AvalonInsertDate           norm! i<c-r>=strftime('%Y/%m/%d %H:%M:%S')<cr>
command! AvalonInsertDateYYYYMMdd   norm! i<c-r>=strftime('%Y%m%d')<cr>

" get hightlight group for word under cursor
command! AvalonGetHlGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
"}}}
"******** AUTOCMDS ******** {{{

" enable fold markers for these files
autocmd FileType c,c++ setlocal foldmethod=syntax
autocmd FileType python,sh setlocal foldmethod=indent
autocmd FileType txt,conf,vim setlocal foldmethod=marker

" https://www.reddit.com/r/vim/comments/48zclk/i_just_found_a_simple_method_to_read_pdf_doc_odt/
" Read-only docs through pandoc (requires pandoc)
autocmd BufReadPre *.docx,*.rtf,*.odp,*.odt silent setlocal readonly
autocmd BufReadPost *.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" Read-only .doc through antiword
autocmd BufReadPre *.doc silent setlocal readonly
autocmd BufReadPost *.doc silent %!antiword "%"

" Read-only pdf through pdftotext (requires poppler-utils)
autocmd BufReadPre *.pdf silent setlocal readonly
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

" remove line numbers when entering terminal:
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
autocmd TermClose * setlocal number relativenumber signcolumn=yes

autocmd FileType markdown,txt setlocal spell
"}}}
"******** MAPPINGS ******** {{{
map <space> <leader>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Don't use Ex mode, use Q for formatting.
noremap Q gq

" go to next/previous tab respectively
noremap  <silent> <M-.> <esc>:tabnext<cr>
inoremap <silent> <M-.> <esc>:tabnext<cr>
noremap  <silent> <M-,> <esc>:tabprevious<cr>
inoremap <silent> <M-,> <esc>:tabprevious<cr>

" open new tab/edit new file
noremap <C-w>e <esc>:edit<space>
noremap <silent> <C-w>t :tabnew<cr>

" open new empty buffer
noremap <silent> <C-w>n :enew<cr>

" delete buffer
noremap <C-w>d <esc>:bdelete<cr>

" edit file under cursor
noremap <silent> <C-w>f <C-w>f<C-w>L

" just use <C-w>c like a responsible individual
noremap <silent> <C-w>q <esc>:close<cr>

" we actually like confirmation thank you very much
noremap ZZ <esc>:quit<cr>
noremap ZQ <esc>:quitall<cr>

" move all buffers to tabs
" https://superuser.com/a/430324/900060
" :h sball
" make this into a function with confirmation in the future?
" noremap <Leader>t <esc>:buffers<cr>:tab sball

" open terminal
" noremap <silent> <Leader>T <esc>:vsplit term://bash<cr>

" stop reading input in terminal
" tnoremap <M-w> <C-\><C-n>

" go to next/previous/last buffer respectively
noremap <silent> GK :bnext<cr>
noremap <silent> GJ :bprevious<cr>
noremap <silent> GL <esc>:buffer #<cr>

" list buffers
noremap <C-w>b <esc>:buffers<cr>:buffer<space>

" toggle line numbers
" noremap <Leader>l <esc>:set relativenumber!<cr>:set number<cr>

" toggle spell / capitalize sentences
noremap <Leader>s <esc>:set spell!<cr>

" disable highlighting for the last search
" (https://stackoverflow.com/a/657484/8225672)
map <silent> <F1> :nohlsearch<cr>
imap <silent> <F1> <esc>:nohlsearch<cr>a

" toggle case insensitive searches
map <Leader>i :set ignorecase!<cr>

" increase/decrease indentation
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" emulate arrow in keys insert mode
inoremap <M-h> <left>
inoremap <M-j> <down>
inoremap <M-k> <up>
inoremap <M-l> <right>

" bind <M-key> to arrow keys in ex mode
:cnoremap <M-l> <right>
:cnoremap <M-h> <left>
:cnoremap <M-j> <down>
:cnoremap <M-k> <up>

" move faster
noremap <C-j> 5j
noremap <C-k> 5k

" pasting over a selection in visual mode doesn't replace the unnamed
" register with the selection
xnoremap <silent> p p:if v:register == '"'<Bar>let @@=@0<Bar>endif<cr>

" don't save characters deleted with x the unnamed register
noremap x "_x
noremap X "_X

" regular s is pretty useless, change it to d{elete} but without overwriting
" the unnamed register
noremap s  "_d
noremap S  "_D
noremap ss "_dd

" c{hange} without overwriting the unnamed register
noremap c "_c
noremap C "_C
noremap cc "_cc

" copy from cursor to end of the line
" see :help Y
nnoremap Y y$

" find and replace
" in visual mode, replace only within selection, non linewise
" https://stackoverflow.com/a/1104144/8225672
nnoremap <M-r> :%s:::gc<left><left><left><left>
vnoremap <M-r> :s:\%V::gc<left><left><left><left>

" filter selection with shell commands
" https://stackoverflow.com/a/2600768/8225672
" vnoremap <M-c> :!eval<space>

" insert a new line, from the current character/end of the line respectively
nnoremap oo o<Esc>
nnoremap OO i<cr><Esc>

" coc sometimes interfere with <M-A>
" inoremap <M-0> <C-o>^
" inoremap <M-a> <C-o>A
" inoremap <M-b> <C-o>b
" inoremap <M-w> <C-o>w

" move lines up or down
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <silent> <M-J> :m .+1<CR>==
nnoremap <silent> <M-K> :m .-2<CR>==
inoremap <silent> <M-J> <Esc>:m .+1<CR>==gi
inoremap <silent> <M-K> <Esc>:m .-2<CR>==gi
vnoremap <silent> <M-J> :m '>+1<CR>gv=gv
vnoremap <silent> <M-K> :m '<-2<CR>gv=gv

" compile a single c file
" noremap <Leader>cc :write<cr>:SingleCompile<cr>
" command! SingleCompile !gcc -W -o "%:r"_temp.out %

" open/close one fold (zA does it recursively)
" zR opens all folds, zM closes all
noremap zz za

" copy file path to clipboard
noremap  <leader>yp :AvalonYankFullPath<cr>
noremap  <leader>yd :AvalonYankDir<cr>

" execute everything to the right of the cursor as ex commands
" noremap <silent> <leader>: y$:<C-r>"<cr>

" guess correct spelling and apply it to all matches
noremap Z= z=1<cr>:silent spellrepall<cr><cr>

" spell, no line numbers, relative movement
noremap <leader>n :call AvalonTogglePrincess()<cr>
let g:PrincessMode = 0
function! AvalonTogglePrincess()
    if g:PrincessMode == 0
        set showtabline=0
        set laststatus=0
        set spell
        set norelativenumber
        set nonumber
        " set signcolumn=no
        set showtabline=0
        noremap j gj
        noremap k gk
        noremap 0 g0
        noremap $ g$
        let g:PrincessMode = 1
    else
        set showtabline=2
        set laststatus=2
        set nospell
        set relativenumber
        set number
        " set signcolumn=yes
        set showtabline=2
        unmap j
        unmap k
        unmap 0
        unmap $
        let g:PrincessMode = 0
    endif
endfunction

" apply macro over visual range (needs register to work)
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" change :q to 'close' so that one must manually :wq or :quit to quit vim when
" there's only one window open
" https://stackoverflow.com/a/14998533
" this is temporary until I lose this tic
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>

" insert ISO date and epoch time
" https://vi.stackexchange.com/a/23351
cabbrev YMDT <C-R>=strftime("%Y-%m-%d_%s")<CR>
"}}}
"******** NEOVIDE ********* {{{
if exists("g:neovide")
    " https://neovide.dev/configuration.html
    " Put anything you want to happen only in Neovide here
    noremap <silent> <C-Tab> <esc>:bnext<cr>
    noremap <silent> <C-S-Tab> <esc>:bprevious<cr>
    " same as p but mimick terminal behaviour just in case I forget
    inoremap <C-V> <C-r>+
    cnoremap <C-V> <C-r>+
    let g:gui_font_size = 10

    silent! execute('set guifont=JetBrains\ Mono:h'.g:gui_font_size)

    function! ResizeFont(delta)
        let g:gui_font_size = g:gui_font_size + a:delta
        execute('set guifont=JetBrains\ Mono:h'.g:gui_font_size)
    endfunction

    noremap <expr><C-+> ResizeFont(1)
    noremap <expr><C-_> ResizeFont(-1)

    let g:neovide_refresh_rate=120
    let g:neovide_refresh_rate_idle=30
    " kde does this automatically
    " let g:neovide_remember_window_size = v:true
    let g:neovide_cursor_vfx_mode = "pixiedust"
    let g:neovide_cursor_vfx_particle_density=30.0
    let g:neovide_cursor_vfx_particle_lifetime=3
    let g:neovide_cursor_trail_length=2

    " confirm quit
    let g:neovide_confirm_quit=1
    " let g:neovide_confirm_quit=v:true
endif
" }}}
"********* notes **********"{{{
" Stuff I want to Remember (cuz brain is dumb, mostly regexes and gcommands and shit)
"→ Use GetHlGroup to get color group under the cursor
"→ use <C-w>f to edit the file under the cursor
"→ use <C-x>,<C-a> to increase/decrease number under cursor
"→ use <C-f> to edit the current command or search pattern
"→ use g<C-a> on a Block selection with 1s to create a incrementing list
"→ use <C-K> to get help on the word under the cursor, including python built-in functions
"→ /(^\|.\)noremap \+<\(silent>\)\@!.*\(:\) (a regex example with lookaheads for when I need to find mappings that should be <silent>)
"→ get spell files for spelling https://github.com/neovim/neovim/issues/2804#issuecomment-109901018
"→ regex to find lines of code, exclude all empty lines and comments (#): ^\(\s\+#\|#\)\@!.\+$
"→ uppercase the first character of every sentence: %s:\(^\|\. \)\a:\U&:gi (see GoodSpell)
"→ uppercase "I"s and change "Im" to "I'm": :%s:\<i\(\>\|m\>\)\@=:\U&:gi | %s:\<Im\>:I'm:g (see GoodSpell)
"→ use zR to open all folds, zM to close all folds
"}}}
"********** LUA ***********"{{{
" lua << EOF
lua require('default_config')
" EOF
"}}}
