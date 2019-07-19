#!/bin/bash
session="work"

# go to source directory
pushd $GOPATH/src/github.com/danalex97/Speer

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n vim

# Select pane 1, set dir to api, run vim
tmux selectp -t 1 
tmux send-keys "vim" C-m 

# Split pane 1 horizontal by 65%, start redis-server
tmux splitw -h -p 35

# Select pane 2 
tmux selectp -t 2
# Split pane 2 vertiacally by 50%
tmux splitw -v -p 50

# select pane 3, set to api root
tmux selectp -t 3
tmux send-keys "htop" C-m 

# Select pane 1
tmux selectp -t 1

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
