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
"TODO:"let s:all_marks = "abcdefghijklmnopqrstuvwxyz.'`^<>\""
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
	" TODO: change all of these to 'a' : { 'name': 'Jump', 'dir': "'a'"}"
		call EasyMarks#InitMappings({
		\   'a' : { 'name': 'Jump' , 'dir': "'a'" }
		\ })
	" }}}
" }}}

" print the word 'ls' to the screen
":execute "echo" "'ls'"

" vim: fdm=marker:noet:ts=4:sw=4:sts=4
