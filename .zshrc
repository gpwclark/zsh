# Exports {{{
export GITHUB_USER="gpwclark"
export GREP_COLOR='1;32'
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export EDITOR="vim"
export BROWSER="/usr/bin/firefox"
#export CLICOLOR=1
# }}}

# My Custom Config {{{
export JAVA_HOME=/lib/jvm/default
export GRADLE_OPTS=-Dorg.gradle.native=false
#eval "$(thefuck --alias fuck)"
setopt nocorrectall #keeps zsh from autocorrecting letting thefuck do that
#feh --bg-scale "$(cd ~/Pictures/bkrd && (find `pwd` -type f | sort -R | head -n 1))"
#~/Pictures/prince_rama.png

function ll() {
	ls -haltr
}

function cl() {
	cd $1
	ls
}

function apply() {
	local IFS=${1}
	shift
	echo "$(( $* ))"

}

function oldls() {
	/usr/bin/ls "$@"
}
# }}}

# DIR_COLORS {{{
#eval `/usr/bin/dircolors -b ~/.dircolors`
#alias dir='dir --color'
#export TERM="xterm-256color"
# }}}

# anaconda {{{
function conda_act() {
    source /opt/anaconda/bin/activate root
}
function conda_deact() {
    source /opt/anaconda/bin/deactivate root
}
#}}}

# Ruby {{{
function get_ruby_version() {
    ruby -v | awk '{print $1 " " $2}'
}
# }}}

# random {{{
function ranstr() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}
# }}}

# Tmux {{{
# starts rescuetime
function tmuxls() {
    tmux list-sessions
}
# Makes creating a new tmux session (with a specific name) easier
function tmuxopen() {
    tmux attach -t $1
	if [[ $? != 0 ]]; then
		tmuxnew $1
	fi
}

# Makes creating a new tmux session (with a specific name) easier
function tmuxnew() {
    tmux new -s $1
}
# Makes deleting a tmux session easier
function tmuxkill() {
    tmux kill-session -t $1
}
# }}}

# custom commands {{{

function gr() {
    cd $(git rev-parse --show-cdup)
}

function zushd() {
	PUSHD_PATH=$1
	_OLD_VIRTUAL_PS1="$PS1"
	if [ "x" != x ] ; then
		PS1="$PS1"
	else
		PS1="[[ $PUSHD_PATH ]] $PS1"
	fi
	export PS1
	pushd $1
}

function zopd() {
    if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
        hash -r 2>/dev/null
    fi
    if ! [ -z "${_OLD_VIRTUAL_PS1+_}" ] ; then
        PS1="$_OLD_VIRTUAL_PS1"
        export PS1
        unset _OLD_VIRTUAL_PS1
    fi
	popd
}

function smite() {
    setopt LOCAL_OPTIONS ERR_RETURN PIPE_FAIL

    local opts=( -I )
    if [[ $1 == '-a' ]]; then
        opts=()
    elif [[ -n $1 ]]; then
        print >&2 'usage: smite [-a]'
        return 1
    fi

    fc -l -n $opts 1 | \
        fzf --no-sort --tac --multi | \
        while IFS='' read -r command_to_delete; do
            printf 'Removing history entry "%s"\n' $command_to_delete
            local HISTORY_IGNORE="${(b)command_to_delete}"
            fc -W
            fc -p $HISTFILE $HISTSIZE $SAVEHIST
        done
}

function remindme() {
    remindMeSetRecurringReminder "$@" &
}

function remindMeSetRecurringReminder() {
    REMINDER_SLEEP_TIME=$1
    PERIOD=$2
    shift
    shift
    REST_OF_PARAMS="$@"
    TO_DO_LIST=""

    OIFS=$IFS
    IFS=","
    for x in $(echo $REST_OF_PARAMS | tr "\n" " ")
    do
        TO_DO_LIST="$TO_DO_LIST\n⚒     $x"
    done
    IFS=$OIFS

    toDo "$TO_DO_LIST"
    for i in $(seq $PERIOD); do
        sleep $REMINDER_SLEEP_TIME && \
        toDo "$TO_DO_LIST"
    done
}

function toDo() {
        notify-send "Current To Do List:" "$@" --icon=notification-message-im &
}

function nsscript() {
    notify-send "SCRIPT TASK" "finished: $1" --icon=system-software-update
}

function ns() {
    notify-send 'new notification!' $1 --icon=process-stop
}

function pns() {
    notify-send -t 0 'new notification!' $1 --icon=process-stop
}

function nss() {
    notify-send $1 $2 --icon=process-stop
}

function processBuildLog() {
    if [[ "SUCCESSFUL" == "$(cat last_build.log| tail -n 2 | head -n 1 | cut -d' ' -f2)" ]];then
        echo "face-wink"
    else
        echo "process-stop"
    fi;
}

function g() {
    ./gradlew "$@" | tee "last_build.log"; notify-send -t 0 "$(basename $PWD) BUILD NOTIFICATION - $(timestamp)" "$(cat last_build.log | tail -n 2 | head -n 2)" --icon="$(processBuildLog build.log)"
}

function lsapclients() {
    create_ap --list-clients $(create_ap --list-running | tail -n 1 | cut -d" " -f1)
}

function myhists() {
    cat ~/.zsh_history | grep -i "$1"
}


function NH() {
    ls -altr | grep -v "\.\|\.\."| grep $@ |  tail -n 1 | tr -s " " | cut -d" " -f11
}

function rev() {
    perl -e 'print reverse <>' $1
}

function timestamp() {
    date +%Y%m%d_%H%M%S
}

function datest() {
    THE_DATE=`TZ=":America/New_York" date`
    echo "$THE_DATE"
}

function stripcolor() {
    perl -pe 's/\e\[?.*?[\@-~]//g' $1
}

#tell me about it!
function tmai() {
	RET=$?
	if [[ ${RET} == 1 ]]; then
		notify-send -t 0 "FAILURE" "$(fortune)" -i ~/Pictures/horde.png
	else
		notify-send -t 0 "SUCCESS" "$(fortune)" -i ~/Pictures/clojure.png
	fi
}

export AIRHEAD="4b825dc642cb6eb9a060e54bf8d69288fbee4904"

function psgrep() {
    ps aux | grep -i $1
}

function fromepoch() {
	date -d @$1
}

function epochms() {
    date +%s%N | cut -b1-13
}

function getip() {
    ifconfig | grep -i wlp4 -A 1 | grep -i inet | tr -s " " | cut -d " " -f 3
}

function murder() {
    kill $(ps -e | grep $1 | awk '{print $1}')
}

function md() {
    pandoc "$1" | lynx -stdin;
}

#i - means that the search is going to be case-insensitive
#n - asks the tool to print the line number next to each match
#I - means grep uses some impressive guesswork to figure out which files are binary not text, and skips matching those.
#E - tells the tool to treat the pattern as a Posix extended regular expression
#r - prepares the tool to look at all the files and sub-folders within the main directory you specify
function megrep() {
    if [ "$2" != "" ]
    then
        grep -inIEr --color=ALWAYS $1 $2
    else
        grep -inIEr --color=ALWAYS $1 ./
    fi
}

function gitgrep() {
    search=$1; shift
    git log --all -10000 --format=%h| while read rev; do
        git show -U0 $rev "$@" |grep --invert-match '^@@' |grep --ignore-case --quiet "$search" && { echo $rev; }
    done
}

function gitshowall() {
    git log --format=%h "$@" |while read rev; do
        git --no-pager show "$rev" "$@"
    done
}

function vimifind() {
    vim $(find . -iname "*$1*" | tr '\n' ' ')
}

function vimfind() {
    vim $(find "$@" | tr '\n' ' ')
}

function ifind() {
    find . -iname "*$1*"
}

function vimgrep() {
    vim $(grep "$@" | sed 's/:.*:.*//' | tr '\n' ' ')
}

function vimag() {
    vim $(ag "$@" | sed 's/:.*:.*//' | tr '\n' ' ')
}

#function to change the name and email of the person who committed in git.
function filter-branch() {
    git filter-branch --env-filter '
    OLD_EMAIL="$1"
    CORRECT_NAME="$2"
    CORRECT_EMAIL="$3"
    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -- --branches --tags
}

function slurp () {
    wget \
        --recursive \
        --no-clobber \
        --page-requisites \
        --html-extension \
        --convert-links \
        --restrict-file-names=windows \
        --domains website.org \
        --no-parent \
        $1
}

funciton slurp2() {
wget --mirror            \
    --convert-links     \
    --html-extension    \
    --wait=2            \
    -o log              \
    $1
}

function DF () {
    df -h | grep -e /dev/sd -e Filesystem
}

function javarepl () {
    rlwrap java -jar ~/bin/java-repl.repo/build/libs/javarepl-dev.jar
}

# }}}

# Alias' {{{
alias trns='tr "\n" " "'
alias vi="vim"
alias r="source ~/.zshrc"
alias tat='tmux new-session -As $(basename "$PWD" | tr . -)' # will attach if session exists, or create a new session
alias tmuxsrc="tmux source-file ~/.tmux.conf"
alias tmuxkillall="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions
alias ct="ctags -R --exclude=.git --exclude=node_modules"
alias dotfiles="ls -a | grep '^\.' | grep --invert-match '\.DS_Store\|\.$'"
alias spacemacs="emacs --insecure"
alias :e="vim"
alias :q!="exit"
alias :q="exit"
#alias dockersage='docker run -v ~/development/ipython/Sage:/home/sage -p 127.0.0.1:8080:8080 -i -t sagemath/sage --notebook=ipython --ip='*' --port=8080'
#alias eclimdd='nohup /lib/eclipse/plugins/org.eclim_2.6.0/bin/eclimd &>/dev/null &'
#alias eclimd='/lib/eclipse/plugins/org.eclim_2.6.0/bin/eclimd'
alias eclimdd=$ECLIPSE_HOME/eclimd
alias setclip='xclip -selection c'
alias sc='xclip -selection c'
alias getclip='xclip -selection c -o'
alias clip='xclip -selection c -o'

#http://www.archlinuxuser.com/2013/01/how-to-record-desktop-into-gif-using.html
function gif() {
    byzanz-record -c -d 30 $1
}

function gif-time() {
    byzanz-record -c -d $2 $1
}
# }}}

# Auto Completion {{{
autoload -U compinit && compinit
zmodload -i zsh/complist

#make all paramters green
zstyle ':completion:*:parameters'  list-colors '=*=32'

# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
# }}}

# Key Bindings {{{
# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Make the `beginning/end` of line and `bck-i-search` commands work within tmux
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey -v # Gives me VIM power in the shell.
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode
# }}}

# Colours {{{
autoload colors; colors

# The variables are wrapped in \%\{\%\}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
    eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS
# }}}

# Set Options {{{
# ===== Basics
setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# ===== Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# ===== Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

# ===== History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

# ===== Completion
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase

unsetopt menu_complete # do not autoselect the first completion entry

# ===== Correction
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments

# ===== Prompt
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted
# }}}

# Prompt {{{
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo 'ɭ'
}

#allow for ~/.box-name override bug use hostname -s
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

if [[ $(box_name) -eq "brumal" ]] || [[ $(box_name) -eq "frostig" ]]; then
	# for dioxus
	export WEBKIT_DISABLE_COMPOSITING_MODE=1
	xset -dpms
	xset s off
	echo "Turned off screensaver/sleep in X"
	PATH="${PATH}:~/.local/share/JetBrains/Toolbox/bin/:~/go/bin/"
	xmodmap -e "clear lock" #disable caps lock switch
	xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape
fi

if [[ -e /etc/gentoo-release ]]; then
#* If you want to enable Portage completions and Gentoo prompt,                                                                               13:42:32 [61/138]
# * emerge app-shells/gentoo-zsh-completions and add
# *      autoload -U compinit promptinit
# *      compinit
# *      promptinit; prompt gentoo
# * to your ~/.zshrc
# * Also, if you want to enable cache for the completions, add
# *      zstyle ':completion::complete:*' use-cache 1
# * to your ~/.zshrc
# * Note that a system zprofile startup file is installed. This will override
# * PATH and possibly other variables that a user may set in ~/.zshenv.
# * Custom PATH settings and similar overridden variables can be moved to ~/.zprofile
# * or other user startup files that are sourced after the system zprofile.
# * If PATH must be set in ~/.zshenv to affect things like non-login ssh shells,
# * one method is to use a separate path-setting file that is conditionally sourced
# * in ~/.zshenv and also sourced from ~/.zprofile. For more information, see the
# * zshenv example in /usr/share/doc/zsh-5.9-r6/StartupFiles/.
# * See https://wiki.gentoo.org/wiki/Zsh/HOWTO for more introduction documentation.
    autoload -U compinit promptinit
    compinit
    promptinit; prompt gentoo
	feh --bg-scale ~/gentoo-tenyearscompiling.jpg
fi

# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[white]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%} [%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}u%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}m%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}s%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {
    # Compose this value via multiple conditional appends.
    local GIT_STATE=""

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi

    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi

    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
    fi
}

# If inside a Git repository, print its branch and state
function git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "on %{$fg[magenta]%}${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

function this {
    pwd | sc
}

function current_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Original prompt with User name and Computer name included...
# PROMPT='
# ${PR_GREEN}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} ${PR_BOLD_BLUE}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%} $(git_prompt_string)
# $(prompt_char) '

# Custom prompt with computer name and pwd
PROMPT='
${PR_BOLD_BLUE}$(box_name)%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%}  $(git_prompt_string)
$(prompt_char) '

#PROMPT='
#${PR_BOLD_BLUE}$(box_name)%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%}  $(git_prompt_string)
#$(prompt_char)'

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

#RPROMPT='${PR_GREEN}$(virtualenv_info)%{$reset_color%} ${PR_BOLD_YELLOW}$(current_pwd)%{$reset_color%} ${PR_RED}$(get_ruby_version)%{$reset_color%}'
# }}}

# History {{{
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
# }}}

# Zsh Hooks {{{
#function precmd {
#    # vcs_info
#    # Put the string "hostname::/full/directory/path" in the title bar:
#    echo -ne "\e]2;$PWD\a"
#
#    # Put the parentdir/currentdir in the tab
#    echo -ne "\e]1;$PWD:h:t/$PWD:t\a"
#}
#
#function set_running_app {
#    printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
#}
#
#function preexec {
#    set_running_app
#}
#
#function postexec {
#    set_running_app
#}
# }}}


# POWERLINE (DISABLED UNTIL ON NEW LINE AT LEAST) {{{
# . /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
#}}}

# PATH Exports {{{
export PATH=~/bin:$PATH # path to local bin is first
export PATH=$PATH:$JAVA_HOME/jre/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/JetBrains/Toolbox/bin
export ECLIPSE_HOME=/usr/lib/eclipse
# }}}


# some systemd aliases {{{
source ~/.config/so-lush/zsh/systemd.sh
# }}}

# syntax highlight config {{{
#duplicate line but must be above all issues uses of ZSH_HIGHLIGHT*
# source /home/price/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 
# ZSH_HIGHLIGHT_HIGHLIGHTER=(main globbing history-expansion)
# ZSH_HIGHLIGHT_STYLES[globbing]='fg=red,bold'
# ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold'

# }}}

# ANDROID {{{
export ANDROID_HOME=/opt/android-sdk
export ANDROID_NDK_HOME=/opt/android-ndk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
# }}}

# env set up {{{
if [[ -a ~/.pc-env-set-up ]]; then
	if [[ $- == *i* ]]; then
		echo -e "No matter where you go,"
		echo -e "there you are."
	fi
    #file found
    #command fortune
else #file not found
    echo "Run Migrations, FIXME";
    #bash .initialize_environment.sh
    touch ~/.pc-env-set-up
fi
# }}}
#

# pnpm
export PNPM_HOME="/home/price/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

### FLOX {{{
eval "$(flox activate -d ~/.config/flox)"
### }}}

#if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
#	source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#	export NIX_PATH="$HOME/.nix-defexpr"
#
#fi
# /Users/price/bin:/Users/price/.cargo/bin:/Users/price/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Users/price/Library/Application Support/JetBrains/Toolbox/scripts:/lib/jvm/default/jre/bin:/Users/price/.local/bin:/Users/price/.local/share/JetBrains/Toolbox/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools

#if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#··. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#fi
## Nix
if [ -e '/home/price/.nix-profile/etc/profile.d/nix.sh' ]; then
	. ~/.nix-profile/etc/profile.d/nix.sh
fi
## End Nix

. "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/price/Downloads/gcloud-api/google-cloud-sdk/path.zsh.inc' ]; then . '/home/price/Downloads/gcloud-api/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/price/Downloads/gcloud-api/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/price/Downloads/gcloud-api/google-cloud-sdk/completion.zsh.inc'; fi

# Turso
export PATH="$PATH:/Users/price/.turso"
