function! neoformat#formatters#javascriptreact#enabled() abort
    return ['prettier', 'prettiereslint']
endfunction

function! neoformat#formatters#javascriptreact#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#javascriptreact#prettiereslint() abort
    return {
        \ 'exe': 'prettier-eslint',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction
