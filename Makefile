HOSTNAME := $(shell hostname -s)

DOTFILES =                           \
	${HOME}/.bash_login                \
	${HOME}/.bashrc                    \
	${HOME}/.bash_logout               \
	${HOME}/.bash/git-completion.bash  \
	${HOME}/.profile                   \
	${HOME}/.gitconfig                 \
	${HOME}/.gitignore

LOCALRC = dot-bashrc.${HOSTNAME}

ifeq ($(wildcard ${LOCALRC}),)
	# Do nothing if ${LOCALRC} doesn't exist.
else
	DOTFILES += ${HOME}/.bashrc.${HOSTNAME}
endif

install: ${DOTFILES}
	@if [ ! -d ${HOME}/.bash ] ; then mkdir ${HOME}/.bash ; fi

diff:
	for i in ${DOTFILES} ;                                \
		do diff -c `echo $$i | sed -e 's/^.*\/\./dot-/'` $$i ; \
	done | less

${HOME}/.bash_login: dot-bash_login
	cp $? $@

${HOME}/.bashrc: dot-bashrc
	cp $? $@

${HOME}/.bashrc.${HOSTNAME}: dot-bashrc.${HOSTNAME}
	cp $? $@

${HOME}/.bash_logout: dot-bash_logout
	cp $? $@

${HOME}/.bash/git-completion.bash: dot-bash/git-completion.bash
	cp $? $@

${HOME}/.profile: dot-profile
	cp $? $@

${HOME}/.gitconfig: dot-gitconfig
	cp $? $@

${HOME}/.gitignore: dot-gitignore
	cp $? $@
