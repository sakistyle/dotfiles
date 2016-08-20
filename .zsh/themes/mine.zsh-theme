# vim:ft=zsh ts=2 sw=2 sts=2
#
# mine's Theme
# A Powerline-inspired theme for ZSH


### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
PRIMARY_BG=blue
SECONDARY_BG=red
TERTIARY_BG=240
QUATERNARY_BG=white
PRIMARY_FG=white
SECONDARY_FG=236
TERTIARY_FG=240

# Characters
SEGMENT_SEPARATOR_LEFT="\ue0b0"
SEGMENT_SEPARATOR_RIGHT="\ue0b2"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg

  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"

  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR_LEFT%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi

  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols=()

  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{blue}%}$GEAR"

  [[ -n "$symbols" ]] && prompt_segment $PRIMARY_FG default " $symbols "
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment $PRIMARY_BG $PRIMARY_FG " %(!.%{%F{yellow}%}.)$user@%m "
  fi
}

# Datetime: current datetime
prompt_datetime() {
  prompt_segment $SECONDARY_BG $PRIMARY_FG ' %D{%Y/%m/%d %T} '
}

# Dir: current working directory
prompt_dir() {
  prompt_segment $TERTIARY_BG $PRIMARY_FG ' %~ '
}

# Git: branch/detached head, dirty status
prompt_git() {
  local color ref

  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }

  ref="$vcs_info_msg_0_"

  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} $PLUSMINUS"
    else
      color=green
      ref="${ref}"
    fi

    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi

    prompt_segment $color $SECONDARY_FG " $ref "
  fi
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR_LEFT"
  else
    print -n "%{%k%}"
  fi

  print -n "%{%f%}\n%{%F{green}%}%#%{%f%} "
  CURRENT_BG=''
}

## Main prompt
prompt_mine_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  prompt_status
  prompt_context
  prompt_datetime
  prompt_dir
  prompt_git
  prompt_end
}

prompt_mine_precmd() {
  vcs_info
  PROMPT='%{%f%b%k%}$(prompt_mine_main)'
  PROMPT2=$(prompt_segment $TERTIARY_BG $PRIMARY_FG " %_ %{%k%F{$TERTIARY_FG}%}$SEGMENT_SEPARATOR_LEFT%{%f%} ")
}

prompt_mine_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_mine_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_mine_setup "$@"
