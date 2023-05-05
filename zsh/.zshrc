# G&S ZSH Config
# Path to your oh-my-zsh installation.
export ZSH="/home/dev/.oh-my-zsh"
export TMUX_CONFIG="~/.config/tmux/.tmux.conf"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export IP=$(hostname -I)
export PATH=$PATH:/mnt/c/xampp/php

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

function clearfe {
    setopt nullglob && setopt rmstarsilent && rm -rf src/app/modules/* src/app/globalModules/* src/app/uiModules/* src/app/ui/* tmpThemes/* src/app/theme/*
}

function phpd() {
        originalWorkingDir="$PWD"
        originalBasePath="/home/dev/gs-docker-dev-env/www/"
        wwwBasePath="/var/www/html/"
        wwwWorkingDir="${originalWorkingDir/"$originalBasePath"/"$wwwBasePath"}"
        paramsj="$@"
        commandsj="php -dxdebug.mode=debug -dxdebug.client_host=docker.for.wsl2.host.internal -dxdebug.client_port=9000 -dxdebug.start_with_request=yes ${paramsj};exit;"
        docker exec -i -w $wwwWorkingDir gs-docker-dev-env_www_1 /bin/bash -c "${commandsj}"
}

source ~/gswsl/scripts/rc.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# CUSTOM CONFIG
# running and sourcing tmux automatically
tmux
tmux source-file ~/.config/tmux/.tmux.conf

ZSH_THEME="agnoster"

# PLUGINS
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  dirhistory
  z
)

# sourcing oh my zsh
source $ZSH/oh-my-zsh.sh

alias ga='git add'
alias gaa='git add --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gs='git status'
alias gp='git pull'
alias gpoa='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull origin develop \;'
alias gpoa38='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull origin release/3.8 \;'
alias gpoa380='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull origin release/3.8.0 \;'
alias gpa='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull origin $1 \;'
alias gcd='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} checkout develop \;'
alias gfunca='find . -maxdepth 1 -type d ( ! -name . ) -exec bash -c "cd '{}' && pwd && $1" \;'
alias ngs='node --max_old_space_size=8096 ./node_modules/.bin/ng serve'
alias gsphp='docker exec gswsl_phpmyadmin_1 php'
alias exectse='docker exec -it gswsl_typesense_1 /bin/bash'
alias execdb='docker exec -it gswsl_db_1 /bin/bash'
alias exects='docker exec -it gswsl_timescale_1 /bin/bash'
alias sdocker='cd ~/gswsl && docker-compose --compatibility up -d --build'
alias sdockerfetch='cd ~/gswsl && docker-compose down && git fetch --all && docker-compose --compatibility up -d --build'
alias sdockerds='cd ~/gs-docker-dev-env && docker-compose down && git fetch --all && git checkout dataSci && docker-compose --compatibility up -d --build'
alias sdocker='cd ~/gswsl && docker-compose --compatibility down'
alias ll='exa -l -g --icons'
alias pecoll='ll | peco'
alias v='vim .'
alias nv='nvim'
alias vsc='code -r'
alias vim='nvim'

## functions
function updateApacheHosts {
    docker exec gs-docker-dev-env_www_1 /bin/bash -c "(echo \"$IP docker.for.wsl2.host.internal\"; cat /etc/hosts) > /etc/newtest.txt && cp /etc/newtest.txt /etc/hosts && rm /etc/newtest.txt" 2> /dev/null
}

function rm_build_folders {
        find . -mindepth 1 -maxdepth 1 -name "build" -print -exec rm -r {} +
}

function rm_orm_folders {
        find . -name "orm" -exec rm -r {} +
}

function multifunction()  {
    find . -maxdepth 1 -type d ( ! -name . ) -exec bash -c "cd '{}' && pwd && $1" \;
}

function clearfe {
   rm -rf src/app/modules/* src/app/globalModules/* src/app/uiModules/* src/app/ui/* tmpThemes/* src/app/theme/*
}

function moin() {
    cd ~/gs-docker-dev-env/www/satConnect/devBE
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/core
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/_devtools
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/modules
    gcd
    gpoa
    z devFE
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects/gs-unityware/src/app/modules
    gpoa
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects/gs-unityware/src/app/uiModules
    gpoa
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects
    gpoa
    z devFE
    ngs;
}

function moin38() {
    sdocker
    cd ~/gs-docker-dev-env/www/satConnect/BE_38
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/BE_38/lib/core
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/BE_38/lib/_devtools
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/BE_38/lib/modules
    gpoa38
    z FE_38
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/FE_38/projects/gs-unityware/src/app/modules
    gpoa38
    cd ~/gs-docker-dev-env/www/satConnect/FE_38/projects/gs-unityware/src/app/uiModules
    gpoa38
    cd ~/gs-docker-dev-env/www/satConnect/FE_38/projects
    gpoa38
    z FE_38
    ngs;
}

function moinBE() {
    cd ~/gs-docker-dev-env/www/satConnect/devBE
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/core
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/_devtools
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devBE/lib/modules
    gpoa;
}

function moinFE() {
    z FE_38
    git pull
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects/gs-unityware/src/app/modules
    gpoa
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects/gs-unityware/src/app/uiModules
    gpoa
    cd ~/gs-docker-dev-env/www/satConnect/devFE/projects
    gpoa
}

## functions for builds

function buildFrontend38BuildLibs {
    grunt setup --buildconfigrepo="satconnect-dev@release/3.8" --backend="http://localhost/satConnect/BE_38/" --docu-base-path="" --build-libs
}

function buildFrontend38 {
    grunt setup --buildconfigrepo="satconnect-dev@release/3.8" --backend="http://localhost/satConnect/BE_38/" --docu-base-path=""
}

function gruntSetupFE {
    grunt setup --buildconfigrepo="satconnect-dev@develop" --backend="http://localhost/satConnect/devbe/" --docu-base-path="" --build-libs
}

function getBackendBuilder {
	git clone git@git.int.gsits.de:setup/BackendBuilder.git .
}

function cloneFEdevelop {
    git clone git@git.int.gsits.de:ERP-v3/gsUnitywareFE.git -b develop devfe
}

function runtmux {
    tmux
    tmux source-file ~/.config/tmux/.tmux.conf
}
