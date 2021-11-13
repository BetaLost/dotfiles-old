function fish_prompt
    set -U fish_prompt_pwd_dir_length 0
    printf "%s%s\n❯%s " (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) 
end
