" EasyMarks - Vim marks, visualized!
"
" Author: Matt Woelk
" Source repository: https://github.com/MattWoelk/vim-easymarks

" Script initialization {{{
	if exists('g:EasyMarks_loaded') || &compatible || version < 702
		finish
	endif

	let g:EasyMarks_loaded = 1
" }}}
" Default configuration {{{
	" Default options {{{
		call EasyMarks#InitOptions({
		\   'leader_key'      : "'"
		\ , 'keys'            : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
		\ , 'do_shade'        : 1
		\ , 'do_mapping'      : 1
		\ , 'grouping'        : 3
		\
		\ , 'hl_group_target' : 'EasyMarksTarget'
		\ , 'hl_group_shade'  : 'EasyMarksShade'
		\ })
	" }}}
	" Default highlighting {{{
		let s:target_hl_defaults = {
		\   'gui'     : ['NONE', '#ff0000' , 'bold']
		\ , 'cterm256': ['NONE', '196'     , 'bold']
		\ , 'cterm'   : ['NONE', 'red'     , 'bold']
		\ }

		let s:shade_hl_defaults = {
		\   'gui'     : ['NONE', '#777777' , 'NONE']
		\ , 'cterm256': ['NONE', '242'     , 'NONE']
		\ , 'cterm'   : ['NONE', 'grey'    , 'NONE']
		\ }

		call EasyMarks#InitHL(g:EasyMarks_hl_group_target, s:target_hl_defaults)
		call EasyMarks#InitHL(g:EasyMarks_hl_group_shade,  s:shade_hl_defaults)

		" Reset highlighting after loading a new color scheme {{{
			augroup EasyMarksInitHL
				autocmd!

				autocmd ColorScheme * call EasyMarks#InitHL(g:EasyMarks_hl_group_target, s:target_hl_defaults)
				autocmd ColorScheme * call EasyMarks#InitHL(g:EasyMarks_hl_group_shade,  s:shade_hl_defaults)
			augroup end
		" }}}
	" }}}
	" Default key mapping {{{
		call EasyMarks#InitMappings({
		\   'f' : { 'name': 'F'  , 'dir': 0 }
		\ , 'F' : { 'name': 'F'  , 'dir': 1 }
		\ , 't' : { 'name': 'T'  , 'dir': 0 }
		\ , 'T' : { 'name': 'T'  , 'dir': 1 }
		\ , 'w' : { 'name': 'WB' , 'dir': 0 }
		\ , 'W' : { 'name': 'WBW', 'dir': 0 }
		\ , 'b' : { 'name': 'WB' , 'dir': 1 }
		\ , 'B' : { 'name': 'WBW', 'dir': 1 }
		\ , 'e' : { 'name': 'E'  , 'dir': 0 }
		\ , 'E' : { 'name': 'EW' , 'dir': 0 }
		\ , 'ge': { 'name': 'E'  , 'dir': 1 }
		\ , 'gE': { 'name': 'EW' , 'dir': 1 }
		\ , 'j' : { 'name': 'JK' , 'dir': 0 }
		\ , 'k' : { 'name': 'JK' , 'dir': 1 }
		\ , 'n' : { 'name': 'Search' , 'dir': 0 }
		\ , 'N' : { 'name': 'Search' , 'dir': 1 }
		\ })
	" }}}
" }}}

" vim: fdm=marker:noet:ts=4:sw=4:sts=4
