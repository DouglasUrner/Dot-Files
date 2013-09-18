DOTFILES = \
	${HOME}/.bash_login            \
	${HOME}/.bashrc                \
	${HOME}/.bash_logout           \
	${HOME}/.profile

install: ${DOTFILES}

diff:
	for i in ${DOTFILES} ;                                \
		do diff -c `echo $$i | sed -e 's/^.*\/\./dot-/'` $$i ; \
	done | less

${HOME}/.bash_login: dot-bash_login
	cp $? $@

${HOME}/.bashrc: dot-bashrc
	cp $? $@

${HOME}/.bash_logout: dot-bash_logout
	cp $? $@

${HOME}/.profile: dot-profile
	cp $? $@
