alias old_bw="bw"

function bitwarden() {
    if [[ -f "$HOME/.zshrc.d/bitwarden_session.private" ]]; then
        export BW_SESSION=$(cat "$HOME/.zshrc.d/bitwarden_session.private")
    else
        password=$(cat "$HOME/.zshrc.d/bitwarden_password.private")
        export BW_SESSION=$(old_bw login --raw --passwordenv BW_PASSWORD="$password")
        echo "$BW_SESSION" >"$HOME/.zshrc.d/bitwarden_session.private"
    fi
    old_bw "$@"
}

alias bw="bitwarden"
