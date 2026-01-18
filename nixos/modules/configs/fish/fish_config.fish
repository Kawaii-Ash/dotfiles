set fish_greeting
set fish_color_command normal
set fish_color_error red
set fish_color_keyword magenta
set fish_color_param normal
set fish_color_quote green
set fish_color_redirection blue
set fish_color_end normal
set fish_color_comment brblack
set fish_color_operator normal
set fish_color_autosuggestion brblack

set fish_pager_color_description blue
set fish_page_color_completion blue
set fish_pager_color_progress --background=brblack

set fish_prompt_suffix ϕ λ
set fish_prompt_suffix $fish_prompt_suffix[(random 1 2)]

set fish_prompt_pwd_full_dirs 2

function fish_prompt
    set -l nix_shell_info (
        if test -n "$IN_NIX_SHELL"
            echo -n "[nix-shell] "
        end
    )

    set -l fish_prompt_pwd (
        if [ $PWD = $HOME ]
            echo -n $PWD
        else
            echo -n (pwd | sed -e "s|.*/\(.*/.*\)|\1|")
        end
    )

    echo \n"$nix_shell_info$fish_prompt_pwd $fish_prompt_suffix" (set_color normal)
end

any-nix-shell fish | source
direnv hook fish | source
