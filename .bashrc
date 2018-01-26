# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases
if [ -f ~/.shell_alias ]; then
	. ~/.shell_alias
fi

# User specific functions
if [ -f ~/.shell_functions ]; then
	. ~/.shell_functions
fi
