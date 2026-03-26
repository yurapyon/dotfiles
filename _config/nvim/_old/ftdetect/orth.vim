autocmd BufRead,BufNewFile *.orth call s:set_orth_filetype()

function! s:set_orth_filetype() abort
    if &filetype !=# 'orth'
        set filetype=orth
    endif
endfunction
