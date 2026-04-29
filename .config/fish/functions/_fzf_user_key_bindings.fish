function fzf_file_select
    # nájde všetky súbory od aktuálneho adresára a prepája cez fzf
    set selected (fd --type f 2>/dev/null | fzf --height 40% --layout=reverse --info=inline)
    
    # ak bol vybraný súbor
    if test -n "$selected"
        # otvor vo VIM, môžeš zmeniť na npr. nano, code, less
        vim "$selected"
    end
end

# bind Ctrl-P na fzf_file_select
bind \cp fzf_file_select
