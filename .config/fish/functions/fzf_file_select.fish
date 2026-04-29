function fzf_file_select
    set selected (fd --type f 2>/dev/null | fzf --height 40% --layout=reverse --info=inline)
    if test -n "$selected"
        nvim "$selected"
    end
end
