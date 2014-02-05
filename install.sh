#!/bin/bash

##############################################################

if [ != "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi

echo "Installing thorin"
cp thorin.rbh $HOME/bin/thorin
chmod +x $HOME/bin/thorin

echo "Installation complete."

exit
