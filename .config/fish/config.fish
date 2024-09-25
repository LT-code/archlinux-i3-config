set fish_greeting

set tide_prompt_char_bg_color red
set tide_git_color_branch 000000
set tide_git_bg_color 1dd05d
set tide_git_bg_color_unstable green
set tide_pwd_color_anchors 000000

set tide_pwd_color 000000
set tide_pwd_color_dirs 000000

set tide_pwd_bg_color 2ab392

if status is-interactive
    # Commands to run in interactive sessions can go here
    bass source ~/.bashrc.functions
    bass source ~/.bashrc.variables
end
