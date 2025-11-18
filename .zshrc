if [[ -z $TMUX ]] && uwsm check may-start && uwsm select; then
	exec systemd-cat -t uwsm_start uwsm start default
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# import zinit
source "${ZINIT_HOME}/zinit.zsh"

# Options
# turn on history 
export HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups 

export PATH=${PATH}:${HOME}/.local/bin:${HOME}/.cargo/bin
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#313244,label:#CDD6F4"

# vulkan-sdk
#export VULKAN_SDK=~/.local/sdk/vulkan-sdk/1.4.321.1/x86_64
#export PATH=$VULKAN_SDK/bin:$PATH
#export LD_LIBRARY_PATH=$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
#export VK_ADD_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
#export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags $FZF_DEFAULT_OPTS --bind=tab:accept

# aliaces
alias ls='eza'
alias l='eza -l -a'
alias f='fzf --preview "fzf-preview {}"'
alias t='tmux new-session -s fap'

# integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# environment
export EDITOR=nvim 

# Plugins

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# from OMZ
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::man 
zinit snippet OMZP::extract
zinit snippet OMZP::archlinux

# load completions 
autoload -U compinit && compinit


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/flekgekei/.millennium/ext/bin
