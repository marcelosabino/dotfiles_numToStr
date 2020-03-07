#!/bin/bash

OMZ_DIR=$HOME/.oh-my-zsh
OMZ_FILE=$OMZ_DIR/oh-my-zsh.sh

if [[ -d "$OMZ_DIR" && -f "$OMZ_FILE" ]];
then
    echo "::[ Already Installed ] 'Oh my zsh'"
    # echo "::[ Updating ] 'Oh my zsh'"
    # $OMZ_FILE && upgrade_oh_my_zsh
else
    echo "::[ Installing ] 'Oh my zsh'"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    if command -v zsh >/dev/null 2>&1; then
        echo "::[ Linking ] '.zshrc'"
        mv ~/.zshrc ~/.zshrc.backup
        ln -sf "$DOTFILES/zsh/zshrc.symlink" ~/.zshrc
    fi

    echo "::[ Installing ] Plugin >> 'zsh-syntax-highlighting'"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    echo "::[ Installing ] Plugin >> 'zsh-autosuggestions'"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    echo "::[ Installing ] Plugin >> 'zsh-completions'"
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
    # autoload -U compinit && compinit

    echo "::[ Installing ] Plugin >> 'zsh-history-substring-search'"
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

    echo "::[ Installing ] Theme >> 'spaceship prompt'"
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

    # Set ZSH_THEME="spaceship" in your .zshrc.
fi