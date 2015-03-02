" Cycle through yanks
let s:cycle_backwards_count = 0
function! unite#history_yank#cycle#QuietlyInvokeUniteYank(history_direction)
    " we're going to do lots of window redrawing
    let lazyredraw_save = &lazyredraw
    set lazyredraw
    " Save layout to ensure unite didn't resize or scroll our window.
    let win_save = winsaveview()

    if a:history_direction <= 0
        " Default case, go to next most recent item (previous on timeline).
        let s:cycle_backwards_count = 0
        let movement_command = 'j'

    else
        " Initial k to to end (multiple k don't wrap).
        let movement_command = 'k'. s:cycle_backwards_count .'k'
        let s:cycle_backwards_count += 1
    endif

    " undo our last paste
    undo

    " Open unite, select an item, and confirm. Cannot use normal! because we
    " need to remap our movement keys within unite. We need to execute these
    " all in one go so opening the unite buffer doesn't interrupt us.
    execute "normal :\<C-u>Unite -no-start-insert -no-resize -no-auto-resize -no-auto-preview -focus -quit history/yank\<CR>". movement_command ."\<CR>"

    call winrestview(win_save)
    let &lazyredraw = lazyredraw_save
endf

" vi: et sw=4 ts=4
