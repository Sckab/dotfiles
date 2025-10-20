#!/bin/bash

read -p "Do you really want to shutdown? [y/n]: " choice

case "$choice" in
    y | Y | yes | YES)
        echo "Shutting down..."
        shutdown now
        ;;
    n | N | no | NO)
        echo "Shutdown aborted."
        ;;
    *)
        echo "Invalid input. Please enter y or n."
        ;;
esac
