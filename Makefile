DOTFILES = \
	${HOME}/.bash_login            \
	${HOME}/.bashrc                \
	${HOME}/.bash_logout

install: ${DOTFILES}

${HOME}/.bash_login: dot-bash_login
	cp $? $@

${HOME}/.bashrc: dot-bashrc
	cp $? $@

${HOME}/.bash_logout: dot-bash_logout
	cp $? $@
