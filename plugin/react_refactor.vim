" --------------------------------
" Add our plugin to the path
" --------------------------------
ruby $LOAD_PATH.unshift File.join(File.dirname(Vim.evaluate('expand("<sfile>")')), '.')
ruby require 'react_refactor'

" --------------------------------
"  Function(s)
" --------------------------------
function! VisualSelection()
  let g:visualmodetype = visualmode()

  if g:visualmodetype ==# 'v'
    execute 'normal! `<v`>y'
  elseif g:visualmodetype ==# 'char'
    execute 'normal! `[v`]y'
  else
    execute 'normal! `<v`>y'
  endif

  return @@
endfunction

function! ExtractClass() range
ruby << endOfRuby

ReactRefactor.execute

endOfRuby
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! ExtractClass call ExtractClass()
