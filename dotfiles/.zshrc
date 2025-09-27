# Add local bin to PATH (Ubuntu/Linux convention)
export PATH="$PATH:$HOME/.local/bin"

# --- Shell options ---
setopt prompt_subst        # Allow parameter expansion in prompt
setopt inc_append_history  # Append commands to history immediately
setopt share_history       # Share command history between sessions
setopt hist_verify         # Verify before executing recalled command
setopt auto_cd             # Enter directories by typing their name
setopt correct             # Suggest corrections for mistyped commands
setopt extended_glob       # Enable extended globbing

# --- Command history ---
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# --- LS colors ---
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# --- Zinit Plugin Manager bootstrap ---
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}Installing ZDHARMA-CONTINUUM Zinit...%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33}Installation successful.%f" || \
        print -P "%F{160}Installation failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# --- Plugins ---
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light romkatv/gitstatus

# --- Git prompt (minimal branch name) ---
git_info() {
    local branch
    branch=$(git branch --show-current 2>/dev/null) || return
    [[ -n $branch ]] && echo "$branch "
}

# --- Abbreviated path printer ---
abbr_path() {
  local path=$PWD
  local prefix=""
  local p=""

  if [[ $path == $HOME* ]]; then
    prefix="~"
    p="${path#$HOME}"
  else
    prefix="/"
    p="${path#/}"
  fi

  [[ -z $p ]] && print -r -- "$prefix" && return

  local -a parts; parts=(${(s:/:)p})
  local out="" n=${#parts}
  local i comp
  for (( i=1; i<=n; i++ )); do
    comp=${parts[i]}
    if (( i < n )); then
      out+="${comp[1,1]}/"
    else
      out+="$comp"
    fi
  done

  print -r -- "$prefix/$out"
}

# --- Prompt ---
PROMPT='%F{green}%n@%m%f %F{cyan}$(abbr_path)%f %F{blue}$(git_info)%f%F{208}$%f '

# --- Git aliases ---
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit -am'
alias gsw='git switch'
alias gswc='git switch -c'
alias gb='git branch -vv'
alias gm='git merge'
alias gr='git rebase'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull --ff-only'
alias gplr='git pull --rebase'
alias gd='git diff'
alias gds='git diff --staged'
alias grs='git restore'
alias grss='git restore --staged'
alias gl='git log --oneline -10'
alias glg='git log --graph --oneline --decorate --all'
alias gst='git stash push'
alias gstp='git stash pop'
alias greset='git reset --hard'

# --- System aliases ---
alias sudo='sudo '
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'
alias h='history'
alias c='clear'
alias dfh='df -hT'
alias duh='du -sh * | sort -h'
alias psg='ps aux | grep -v grep | grep -i'

# --- Useful shortcuts ---
alias please='sudo $(fc -ln -1)' # Run last command with sudo
alias cls='clear && ls'
alias hgrep='history | grep'
alias tree3='tree -L 3 -I "node_modules|__pycache__|.git|.venv|env|venv|build|dist"'
alias treed='tree -D -I "node_modules|__pycache__|.git|.venv|env|venv|build|dist"'

# --- Development / utilities ---
alias npmg='npm list -g --depth=0'
alias serve='python3 -m http.server'
alias myip='curl -s ifconfig.me'
alias v='nvim'
alias j='journalctl -xe'

# --- Programming dirs ---
alias weba='cd ~/projects/web/astro && ls'
alias webe='cd ~/projects/web/11ty && ls'
alias webr='cd ~/projects/web/react && ls'
alias webn='cd ~/projects/web/next && ls'

# --- Completion system ---
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# --- Better completion styles ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# --- Run neofetch if available ---
if command -v neofetch >/dev/null 2>&1; then
  neofetch
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
