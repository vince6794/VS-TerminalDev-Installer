function! neoformat#formatters#typescriptreact#enabled() abort
    return ['prettier', 'prettiereslint']
endfunction

function! neoformat#formatters#typescriptreact#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#prettiereslint() abort
    return {
        \ 'exe': 'prettier-eslint',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction
