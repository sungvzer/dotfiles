alias vv="nvim ."
alias v="nvim"
# Enable alias expansion in sudo
alias sudo="sudo "

alias gpb="git prune-branches"
alias gfix="gc -m fixup && gsta && grbi develop && gpf && gstp"
alias zshrc="${EDITOR} ~/.zshrc"
alias t="tmux"
alias ta="tmux attach"

alias gwb="git welcome-back"

alias tp="trash-put"

function webp() {
    cwebp -size 1024000 "$1" -o "${1%.*}.webp"
}
