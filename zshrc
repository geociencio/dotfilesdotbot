#!/bin/zsh

# ----------------------------------#
#  Archivo:     zshrc               #
#  Version:     2021.06.08          #
#  Autor:       Juan M Bernales     #
#  LicenCIA:    GNU GPL             #
#-----------------------------------#

#--------------------
# Config zsh basica.
#-------------------

umask 077
ZDOTDIR=${ZDOTDIR:-${HOME}}
ZSHDDIR="${HOME}/.dotfiles/zsh/zsh.d"
HISTFILE="${ZDOTDIR}/.dotfiles/zsh/zsh_hist"
HISTSIZE='128000'
SAVEHIST='128000'

setopt EXTENDED_HISTORY                       # Escribe el archivo de historial en el formato ': inicio: transcurrido; comando'.
setopt SHARE_HISTORY                          # Compartir historial entre todas las sesiones.
setopt HIST_EXPIRE_DUPS_FIRST                 # Primero caduca un evento duplicado al recortar el historial.
setopt HIST_IGNORE_DUPS                       # No registre un evento que se acaba de registrar nuevamente..
setopt HIST_IGNORE_ALL_DUPS                   # Elimina un evento grabado antiguo si un evento nuevo es un duplicado.
setopt HIST_FIND_NO_DUPS                      # No muestra un evento encontrado anteriormente.
setopt HIST_IGNORE_SPACE                      # No registre un evento que comience con un espacio.
setopt HIST_SAVE_NO_DUPS                      # No escriba un evento duplicado en el archivo histórico.
setopt HIST_VERIFY                            # No se ejecuta inmediatamente después de la expansión del historial.

export EDITOR="/usr/bin/vim"

#----------------
# Navegacion
#---------------

setopt AUTO_CD                                # Ir a la ruta de la carpeta sin usar cd.
setopt AUTO_PUSHD                             # Empuje el directorio antiguo en la pila en el CD.
setopt PUSHD_IGNORE_DUPS                      # No almacene duplicados en la pila.
setopt PUSHD_SILENT                           # No imprima la pila de directorios después de pushd o popd.
setopt CORRECT                                # Corrección ortográfica
setopt CDABLE_VARS                            # Cambiar de directorio a una ruta almacenada en una variable.
setopt EXTENDED_GLOB                          # Utilice una sintaxis globbing extendida.

#
# Aliases
#
source /home/juanb/.dotfiles/zsh/aliases

#
# Ayuda a conpletar
#
source /home/juanb/.dotfiles/zsh/completion.zsh

# +-----+
# | FZF |
# +-----+

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
    source /home/juanb/.dotfiles/zsh/scripts_fzf.zsh # fzf Scripts

    # Search with fzf and open selected file with Vim
    bindkey -s '^v' 'vim $(fzf);^M'
fi


#------------------------------
# Combinaciones de teclas
#------------------------------
bindkey -v
export KEYTIMEOUT=1
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line


#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

#fpath=(/home/juanb/.dotfiles/zsh/ $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

#Iniciar resaltado
#if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
#  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fi
# Dracula Theme (for zsh-syntax-highlighting)
# https://github.com/zenorocha/dracula-theme
# Copyright 2021, All rights reserved
# Code licensed under the MIT license
# http://zenorocha.mit-license.org
# @author George Pickering <@bigpick>
# @author Zeno Rocha <hi@zenorocha.com>
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
# Default groupings per, https://spec.draculatheme.com, try to logically separate
# possible ZSH_HIGHLIGHT_STYLES settings accordingly...?
# Italics not yet supported by zsh; potentially soon:
#    https://github.com/zsh-users/zsh-syntax-highlighting/issues/432
#    https://www.zsh.org/mla/workers/2021/msg00678.html
# ... in hopes that they will, labelling accordingly with ,italic where appropriate
# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6272A4'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[function]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[command]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#50FA7B,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#FFB86C,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#BD93F9'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#8BE9FD'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#FF79C6'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#F1FA8C'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#F8F8F2'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[path]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#BD93F9'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[default]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[cursor]='standout'
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfilesdotbot/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#
#-----------------------------
# Prompt
#------------------------------
#autoload -U colors zsh/terminfo
#colors
#fpath=(/home/bernales/dotfilesdotbot/zsh/ $fpath)
#autoload -Uz prompt_geoc.zsh; prompt_geoc.zsh
#           (esto solo tiene sentido en los formatos de acción)
autoload -Uz vcs_info 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{#D7005F} *"
zstyle ':vcs_info:*' stagedstr "%F{#5FFF00}"
zstyle ':vcs_info:git:*' formats '%F{#D40D1D}% Git%F{#0DD4D0}:%F{#FFD787}%b%u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'
zstyle ':vcs_info:*' enable git
RPROMPT='${vcs_info_msg_0_}'
PROMPT='%(?.%F{green}Y.%F{red}?%?)%f %B%F{blue}%3~%f%b%(!.#.>)'

