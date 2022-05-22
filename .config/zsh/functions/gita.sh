#!/bin/sh

# Manage all my Git repositories

gita () {
	find ~/Development -type d -name .git -printf "\n------------------------------------------------------------\n" -printf "\n Repo: %h\n\n" -execdir git $1 {} +
	echo ""
	echo "------------------------------------------------------------"
}
