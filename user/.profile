#!/bin/sh

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export VIDEO=/usr/bin/mpv
