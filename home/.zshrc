# --- System Path Configuration ---
# Ensure .local/bin is prioritized
export PATH="$HOME/.local/bin:$PATH"

# --- Shell Options ---
setopt prompt_subst        # Allow parameter expansion in prompt
setopt inc_append_history  # Append commands to history immediately
setopt share_history       # Share command history between sessions
setopt hist_verify         # Verify before executing recalled command
setopt auto_cd             # Enter directories by typing their name
setopt correct             # Suggest corrections for mistyped commands
setopt extended_glob       # Enable extended globbing

# --- Command History ---
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# --- Zinit Plugin Manager Bootstrap ---
ZINIT_DIR="$HOME/.local/share/zinit/zinit.git"
if [[ ! -f $ZINIT_DIR/zinit.zsh ]]; then
    print -P "%F{33}Installing Zinit...%f"
    command mkdir -p "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_DIR"
fi
source "$ZINIT_DIR/zinit.zsh"

# --- Plugins Loading ---
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
# Syntax highlighting must be loaded last
zinit light zsh-users/zsh-syntax-highlighting

# --- Fast Native Prompt (Zero Subshells) ---
# %n=user %m=machine %2~=current and parent dir only %=orange symbol
PROMPT='%F{green}%n@%m%f %F{cyan}%2~%f %F{208}$%f '

# --- Git & Lazygit ---
alias g='git'
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline -10'
alias gp='git push'
alias gpl='git pull --ff-only'
alias lg='lazygit'

# --- System Aliases ---
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

# --- Tooling Upgrades (Fallback to standard if missing) ---
command -v eza >/dev/null && alias ls='eza --icons' && alias ll='eza -al --icons'
command -v bat >/dev/null && alias cat='bat'

alias please='sudo $(fc -ln -1)'
alias cls='clear && ls'
alias hgrep='history | grep'
alias tree3='tree -L 3 -I "node_modules|__pycache__|.git|.venv|env|venv|build|dist"'

# --- Development & Automation ---
alias serve='python3 -m http.server'
alias myip='curl -s ifconfig.me'
alias v='nvim'
alias j='journalctl -xe'

# --- Zinit Completion Management System ---
autoload -Uz compinit
# Optimize compinit by only running it once a day (speeds up shell startup)
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit -d "$HOME/.zcompdump"
else
    compinit -C -d "$HOME/.zcompdump"
fi
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# --- Fast Environment Initializations ---
[[ -d "$HOME/.fnm" ]] && export PATH="$HOME/.fnm:$PATH"
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd)"
command -v uv >/dev/null && eval "$(uv generate-shell-completion zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# --- Fuzzy Finder (fzf) Integration ---
if command -v fzf >/dev/null; then
    [[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
    [[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
    
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=dark"
    export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    
    # Interactive fzf branch switcher
    gswb() {
        local branch
        branch=$(git branch -a | grep -v 'HEAD ->' | fzf --prompt="Switch Branch: " | sed "s/.* //" | sed "s#remotes/[^/]*/##")
        if [[ -n "$branch" ]]; then
            git switch "$branch"
        fi
    }
fi

# --- Cheat Sheet / Help helper ---
dothelp() {
    local BLUE=$'\e[1;34m'
    local CYAN=$'\e[1;36m'
    local NC=$'\e[0m'

    echo "${BLUE}=== Zsh Aliases & Shortcuts Cheat Sheet ===${NC}"
    echo ""
    echo "${CYAN}Git & Lazygit Shortcuts:${NC}"
    echo "  g         ➜ git"
    echo "  gs        ➜ status -sb"
    echo "  gd / gds  ➜ diff / diff staged"
    echo "  gl        ➜ log latest 10"
    echo "  gp / gpl  ➜ push / pull fast-forward"
    echo "  lg        ➜ launch lazygit"
    echo "  gswb      ➜ fuzzy switch git branch (fzf)"
    echo ""
    echo "${CYAN}System Utilities:${NC}"
    echo "  ll / la   ➜ ls -alF / ls -A (using eza if installed)"
    echo "  cls       ➜ clear && ls"
    echo "  please    ➜ run last command as sudo"
    echo "  hgrep     ➜ search history"
    echo "  tree3     ➜ print directory tree (depth 3)"
    echo "  v         ➜ nvim"
    echo "  serve     ➜ start python http server"
    echo "  myip      ➜ get public IP"
}
alias dots="dothelp"
alias cheats="dothelp"

# --- Fast System Info Fetch ---
if command -v fastfetch >/dev/null 2>&1; then
  printf '\e[?7l' # Disable line wrap
  fastfetch
  printf '\e[?7h' # Enable line wrap
fi

# --- Local / Host-Specific Configurations ---
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
