# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
MAKE_GEN=/Applications/microchip/mplabx/v3.15/mplab_ide.app/Contents/Resources/mplab_ide/bin/
CSR_BIN="/Users/ross/Documents/uenergy2_6_1_7/tools/bin"
#CSR_BIN="/Users/ross/Documents/uenergy7_0/tools/bin"
MPLAB_X16_BIN="/Applications/microchip/xc16/v1.23/bin"
export PATH=/usr/local/bin:$MAKE_GEN:$PATH:$CSR_BIN:$MPLAB_X16_BIN

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

export UENERGY_SDK2617_DIR="/users/ross/documents/uenergy2_6_1_7"
export UENERGY_DIR="/users/ross/documents/uenergy7_0"
export CSR_IMGS_DIR="/Users/ross/Documents/git/opossum/poleposition/csr_update_imgs"

export EDITOR='subl -w'

export LC_TYPE=C
export LANG=C

alias usb="ls /dev/tty.*"
alias v2="cd ~/Documents/git/opossum/"
alias csr="cd ~/Documents/git/kingharald/"
alias csrdoc="open ~/Dropbox\ \(Boosted\)/Embedded\ Resources/CSR/Docs/reference/html/index.html"
alias csrf="cd ~/Dropbox\ \(Boosted\)/Embedded\ Resources/CSR/"

if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

clean_path ()
{
  if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}       # the first remaining entry
        case $PATH: in
            *:"$x":*) ;;         # already there
            *) PATH=$PATH:$x;;    # not there yet
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}

mcd ()
{
   mkdir $1
   cd $1
}

cd_func ()
{
   local x2 the_new_dir adir index
   local -i cnt

   if [[ $1 ==  "--" ]]; then
     dirs -v
     return 0
   fi


   the_new_dir=$1
   [[ -z $1 ]] && the_new_dir=$HOME

   if [[ ${the_new_dir:0:1} == '-' ]]; then
     #
     # Extract dir N from dirs
     index=${the_new_dir:1}
     [[ -z $index ]] && index=1
     adir=$(dirs +$index)
     [[ -z $adir ]] && return 1
     the_new_dir=$adir
   fi

   #
   # '~' has to be substituted by ${HOME}
   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

   #
   # Now change to the new dir and add to the top of the stack
   pushd "${the_new_dir}" > /dev/null
   [[ $? -ne 0 ]] && return 1
   the_new_dir=$(pwd)

   #
   # Trim down everything beyond 11th entry
   popd -n +11 2>/dev/null 1>/dev/null

   #
   # Remove any other occurence of this dir, skipping the top of the stack
   for ((cnt=1; cnt <= 20; cnt++)); do
     x2=$(dirs +${cnt} 2>/dev/null)
     [[ $? -ne 0 ]] && return 0
     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
     if [[ "${x2}" == "${the_new_dir}" ]]; then
       popd -n +$cnt 2>/dev/null 1>/dev/null
       cnt=cnt-1
     fi
   done

   return 0
}

alias cd=cd_func

# set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

##
# Your previous /Users/ross/.bash_profile file was backed up as /Users/ross/.bash_profile.macports-saved_2016-04-18_at_17:00:17
##

# MacPorts Installer addition on 2016-04-18_at_17:00:17: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="/usr/local/bin/make:$PATH"
