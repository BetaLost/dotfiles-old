function fish_prompt
    set fish_prompt_pwd_dir_length 0
    printf "%s%s\n❯%s " (set_color $fish_color_end) (prompt_pwd) (set_color normal) 
end
