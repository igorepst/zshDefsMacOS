#!/usr/bin/env sh

doWork() {
    
    brew update && brew upgrade --greedy && brew cleanup
    brew install powerlevel10k
    brew install zsh-autosuggestions
    brew install zsh-syntax-highlighting
    brew install zsh-history-substring-search
    brew install zsh-completions
    brew install coreutils
    brew install fzf
    brew install --cask font-dejavu-sans-mono-nerd-font

    if [ -f "${HOME}/.zprofile" ]; then
	mv "${HOME}/.zprofile" "${HOME}/.zprofile"
    fi
    if [ -f "${HOME}/.zshenv" ]; then
	mv "${HOME}/.zshenv" "${HOME}/.zshenv.bak"
    fi
    if [ -f "${HOME}/.zshrc" ]; then
	mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
    fi
    
    cp -r ./zshInst "${HOME}/.config"
    cp ./.zshenv "${HOME}/.zshenv"

     if [ -f "${HOME}/.zsh_history" ]; then
	mv "${HOME}/.zsh_history" "${HOME}/.config/zshInst/.zsh_history"
    fi
    
    printf 'Done\n'
    printf 'Go to Terminal -> Settings -> Profiles -> Basic -> Text and replace font to "DejaVuSansM Nerd Font Mono"\n'
    printf 'Go to Terminal -> Settings -> Profiles -> Basic -> Keyboard and mark "Use Option as Meta key""\n'
    printf 'Close Terminal fully with Cmd+Q and reopen it\n'
}

doWork "$@"
