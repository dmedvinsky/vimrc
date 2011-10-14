.PHONY: install

install:
	mkdir -p bundle
	test -d bundle/vundle || git clone https://github.com/gmarik/vundle.git bundle/vundle
	test -f ${HOME}/.vimrc  && mv ${HOME}/.vimrc  ${HOME}/.vimrc.bak
	test -f ${HOME}/.gvimrc && mv ${HOME}/.gvimrc ${HOME}/.gvimrc.bak
	ln -s .vim/vimrc  ${HOME}/.vimrc
	ln -s .vim/gvimrc ${HOME}/.gvimrc
