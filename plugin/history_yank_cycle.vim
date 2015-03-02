
nnoremap <Plug>(unite-history-yank-cycle-previous)  :call unite#history_yank#cycle#QuietlyInvokeUniteYank(-1)<CR>
nnoremap <Plug>(unite-history-yank-cycle-next)      :call unite#history_yank#cycle#QuietlyInvokeUniteYank( 1)<CR>

if !exists("g:history_yank_cycle_no_mappings") || !g:history_yank_cycle_no_mappings
    nmap <C-p> <Plug>(unite-history-yank-cycle-previous)
    nmap <C-n> <Plug>(unite-history-yank-cycle-next)
endif


" vi: et sw=4 ts=4
