#!/bin/bash

CONFIG_FILE="/home/jamie/.devenvrc"
OP_FILE=/home/jamie/.devenvrc
ARGS=$1
conf_dir=""
conf_set=0
check_config()
{
    dirstring=""
    while IFS=: read -r f1
    do
        dirstring=$f1
    done <"$CONFIG_FILE"
    if [[ $dirstring = *"/"* ]]; then 
        conf_dir=$dirstring
        echo $conf_dir
        conf_set=1
    else
        conf_set=0
    fi
}

# We didn't get a command line argument
if [ $# -eq 0 ]
  then
      check_config
      status=$conf_set
    if [ $status -ne 0 ]
    then
        ARGS=$conf_dir
    else
        echo "Usage: devenv <starting directory>"
        exit 1
    fi
else
    # We did get a valid command line argument
    if [ -d $ARGS ]
    then
        # The directory exists - set ARGS and write config file
        if [ $ARGS = "." ]
        then
            ARGS=$PWD
        fi
        if [ -f $OP_FILE ]
        then
            echo "$ARGS" > "$OP_FILE"
        fi
    else
        echo "Error: Directory doesn't exist."
        exit 1
    fi
fi
#
#
#
SESSION="DEVENV"
tmux new-session -d -s $SESSION -c "$ARGS" -n "code"
#tmux split-window -h -p 30
tmux split-window -l 1 -v -c "$ARGS"
tmux new-window -t $SESSION:2 -n "shell" -c "$ARGS"
tmux select-window -t $SESSION:1
tmux select-pane -t 0
tmux -2 attach-session -d
