# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$HOME/.arkade/bin
export PATH=$PATH:~/.local/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    poetry
)

source ~/.zshrc.secret

source $ZSH/oh-my-zsh.sh

source /Users/chantakyu/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Dev set up
alias gauth='npx google-artifactregistry-auth'

# JDK set up
alias j11='export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home; java --version'
alias j8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_351.jdk/Contents/home; java -version'

# user configuration
# custom aliases
alias ll="ls -1a"
alias ..="cd ../"
alias ..l="cd ../ && ll"
alias pg="echo 'Pinging Google' && ping www.google.com"
alias de="cd ~/Desktop"
alias dd="cd ~/code"
alias d="cd ~/code && cd "
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

## google cloud aliases
alias gcp="gcloud"
alias gcpi="gcloud beta interactive"

## git aliases
function gc { git commit -m "$@"; }
# alias gcm="git checkout main"
alias gcdev="git checkout develop"
alias gcba="git checkout -"
alias gs="git status"
alias gpull="git pull"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gf="git fetch origin"
alias gpush="git push"
alias gd="git diff"
alias ga="git add ."
alias gb="git branch"
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog"
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git gpush --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

## checkout a new remote branch (exists remote, not locally)
## git checkout -b LocalName origin/remotebranchname (checkout a remote branch)

## 1Password alias
alias opfzf="op item list --vault personal | fzf"

## aws
alias aws-login="aws-vault login franky-ro"

## npm aliases
alias ni="npm install"
alias nrs="npm run start -s --"
alias nrb="npm run build -s --"
alias nrd="npm run dev -s --"
alias nrt="npm run test -s --"
alias nrtw="npm run test:watch -s --"
alias nrv="npm run validate -s --"
alias rmn="rm -rf node_modules"
alias flush-npm="rm -rf node_modules && npm i && echo NPM is done"

## yarn aliases
alias yar="yarn run"      # lists all the scripts we have available
alias yab="yarn build"    # build dist directory for each package
alias yal="yarn lint:fix" # format source and auto-fix eslint issues
alias yac="yarn commit"   # open a Q&A prompt to help construct valid commit messages
alias yas="yarn start"
alias yasb="yarn start:storybook" # start storybook
alias yat="yarn test"             # run the unit tests*
alias yatw="yarn test:watch"      #run the unit tests for files changed on save

## neovim
alias vim="nvim"
alias cdvim="cd ~/.config/nvim"

## tmux
alias tmuxcf="nvim ~/.config/tmux/.tmux.conf"

## docker
alias dockerstop='docker-compose stop'
alias dockerrestart='docker-compose restart'
alias dockerup='docker-compose up -d'
alias dockerrm='docker-compose rm --all'

## Kubectl
alias kc='kubectl'

## Minikube
alias mini='minikube'

## Stow
stowln() {
  stow -vSt ~ $1
}

teststowln() {
  stow -nvSt ~ $1
}

unstowln() {
  stow -vDt ~ $1
}

testunstowln() {
  stow -nvDt ~ $1
}

## Lazygit
alias lzg="lazygit"

## other aliases
alias cdw='cd ~/applications/workdir'
alias cdp="cd ~/applications/pdir"
alias cdj="cd ~/applications/workdir/jsonDir"
alias cdcf="cd ~/.config"
alias cddot="cd ~/dotfiles"
alias learndir='cd ~/Desktop/learn'
alias zshrc='code ~/.zshrc'
alias trainbash='code /Users/franky/Desktop/learn/test.sh'
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "
alias ..='cd ..'
alias ...='cd ../..'source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

## Mobile development
alias astudio="open -a /Users/chantakyu/Applications/Android\ Studio.app"
alias xc="open -a Xcode"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chantakyu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chantakyu/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chantakyu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chantakyu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export DATCH_TOOLS_PATH=~/tools
export PATH=$DATCH_TOOLS_PATH/scripts:$PATH

export EDITOR=nvim
export DATCH_TOOLS_PATH=/Users/chantakyu/applications/workdir/tools
export PATH=$DATCH_TOOLS_PATH/scripts:$PATH

# pnpm
export PNPM_HOME="/Users/chantakyu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# pipenv
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# pyenv (python version manager) 
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry (package version manager for application development) https://python-poetry.org/docs/#installing-with-pipx
# [Not needed in oh my zsh] In a Unix-based shell environment, the fpath environment variable is used to specify the directories where the shell looks for executable files when you type a command. 
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

# ============= Auto completion =================
source <(kubectl completion zsh)

export PATH=$(which aws_completer):$PATH
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C $(which aws_completer) aws
