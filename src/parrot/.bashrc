# Configuring tmux
if which tmux >/dev/null 2>&1
then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
    # when quitting tmux, try to attach
    while test -z ${TMUX}
    do
        tmux attach || break
    done
fi

# Adding a space between the prompt and the input
PS1+=' '

# Defining aliases
alias cat='batcat'
