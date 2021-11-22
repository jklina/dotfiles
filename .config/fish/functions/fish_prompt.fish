function fish_prompt
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)
    end

    echo -n (set_color blue)(prompt_pwd)

    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color red)'# '
    end
    echo -n (set_color normal) (fish_git_prompt) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
