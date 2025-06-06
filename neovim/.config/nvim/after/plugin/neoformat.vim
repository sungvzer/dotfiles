let g:neoformat_try_node_exe = 1

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_try_node_exe = 1

let g:latexindent_opt="-m"

augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
