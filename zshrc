# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  extract
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
####################################################################
#  Add cuda tools to command path                                  #
####################################################################
export GUROBI_HOME="/opt/gurobi1000/linux64"
export Z3_HOME="${HOME}/.local/lib/python3.10/site-packages/z3"

export PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"
export PATH="${HOME}/.local/bin/${PATH:+:${PATH}}"
export PATH="${GUROBI_HOME}/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export LD_LIBRARY_PATH="${HOME}/.local/lib/python3.10/site-packages/tensorrt${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
export CUDA_HOME=/usr/local/cuda

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
# Display time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="　"
SPACESHIP_TIME_COLOR=magenta
# Display username
SPACESHIP_USER_SHOW=always
# Display directory
SPACESHIP_DIR_TRUNC_REPO=false
# Display async
SPACESHIP_ASYNC_SHOW=false
####################################################################

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function cd {
  builtin cd "$@" && ls -lXhF --color=always
}
alias ls='ls -lXhF --color=always'
alias rm='rm -i'
alias gh='cd ~/Github'
alias ptt='ssh bbsu@ptt.cc'
alias gputem='nvidia-settings -q gpucoretemp'
alias sshpc='ssh kevin@75.54.112.51 -p 6666 -XY'
alias sftppc='sftp -P 6666 kevin@75.54.112.51'
alias sshleonardo='ssh kcchang@leonardo.usc.edu -XY'
alias sftpleonardo='sftp kcchang@leonardo.usc.edu'
alias ssharchimedes='ssh kcchang@archimedes.usc.edu -XY'
alias sftparchimedes='sftp kcchang@archimedes.usc.edu'
alias sshautolab='ssh kevin@10.136.200.8 -XY'
alias sftpautolab='sftp kevin@10.136.200.8'
alias sshvlsi='ssh kchang94@viterbi-scf1.usc.edu'
function sshfvlsi {
  ssh -L 6666:localhost:${1:-15008} -N -f -l kchang94 viterbi-scf1.usc.edu
}
alias sftpvlsi='sftp kchang94@viterbi-scf1.usc.edu'
function sshYlab {
  ssh b04901136@eda.ee.ntu.edu.tw -p ${1:-50032} -X
}
function sftpYlab {
  sftp -P ${1:-50032} b04901136@eda.ee.ntu.edu.tw
}
function sshedaunion {
  ssh pd1812@edaunion.ee.ntu.edu.tw -p ${1:-40055} -X
}
function sftpedaunion {
  sftp -P ${1:-40055} pd1812@edaunion.ee.ntu.edu.tw
}
alias sshRLab='ssh b04901136@140.112.175.122'
alias sftpRLab='sftp b04901136@140.112.175.122'
alias movie='mpv --cache-secs=600'

alias tb='tensorboard --logdir '

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
####################################################################
# colorful ascii plot                                              #
####################################################################
archey --distribution darwin | lolcat -p 0.5
figlet Kevin C. Chang -t | lolcat -p 0.5
fortune | cowsay | lolcat -p 0.5
