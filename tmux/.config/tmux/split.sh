#!/bin/bash

# Split 2 half bottom panes
tmux split-window -v -p 50
tmux split-window -h -p 50

# Go back to top pane and split half horizontally
tmux select-pane -U
tmux split-window -h -p 50
