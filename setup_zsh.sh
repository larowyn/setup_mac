#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh --version # Check installation success by displaying version

chsh -s $(which zsh) # Make zsh the default shell
