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

fpath=(/home/juanb/.dotfiles/zsh/ $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

#Iniciar resaltado
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
