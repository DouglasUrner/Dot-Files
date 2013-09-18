DOTFILES = \
	${HOME}/.bash_login            \
	${HOME}/.bashrc                \
	${HOME}/.bash_logout           \
	${HOME}/.profile

install: ${DOTFILES}

diff: ${DOTFILES}
	for i in ${DOTFILES} ;                                \
		do diff `echo $$i | sed -e 's/^.*\/\./dot-/'` $$i ; \
	done

${HOME}/.bash_login: dot-bash_login
	cp $? $@

${HOME}/.bashrc: dot-bashrc
	cp $? $@

${HOME}/.bash_logout: dot-bash_logout
	cp $? $@

${HOME}/.profile: dot-profile
	cp $? $@
