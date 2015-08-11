if match(expand('%'), '.*pom.xml\s*$') < 0
	finish
endif

echo "Sourcing java ftplugins..."
ru! ~/.vim/ftplugin/java/*.vim
redraw
