# Run to get bash autocomplete functions in zsh shell
# autoload bashcompinit
# bashcompinit
# autoload -Uz compinit
# compinit

# enable to run zprof for speed tests
# zmodload zsh/zprof

export EDITOR=zed

export MARKPATH="$HOME/marks"

# make sure that go (the language) still works
alias golang='command go'

# jump to a marked path
function go() {
    # change directory to the marked path, if it does not exist, ignore the error and print "No such mark: $1" instead
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
    clear
}

function omark() {
    open "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function cmark() {
    code "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

# mark a path for quick access
function mark() {
    # create a folder to store marks
    mkdir -p "$MARKPATH"

    # create a symlink in the mark folder to the current directory
    ln -s "$(pwd)" "$MARKPATH/$1"
}

# delete a mark
function unmark() {
    # remove the symlink
    rm -i "$MARKPATH/$1"
}

# list all marks
function marks() {
    # list all symlinks in the mark folder with some formatting magic to make it look nicer
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

# autocomplete marks
function _cdd() {
    # get the current word being completed
    local cur=${COMP_WORDS[COMP_CWORD]}
    # generate possible matches and store them in the COMPREPLY variable
    COMPREPLY=($(compgen -W "$(ls $MARKPATH)" -- $cur))
}

# register the completion function to be called for the cdd command
complete -F _cdd go
complete -F _cdd op
complete -F _cdd cmark


function b {
    cd ..
}

function bb {
    cd ..
    cd ..
}

function bbb {
    cd ..
    cd ..
    cd ..
}

function c() {
    if [ $# -eq 0 ]; then
        # No arguments - open current directory in VS Code
        code .
    elif [ -L "$MARKPATH/$1" ]; then
        # Argument is a mark - open the marked path in VS Code
        code "$MARKPATH/$1"
    else
        # Argument is not a mark - use original behavior
        code "$@"
    fi
}

function o() {
    if [ $# -eq 0 ]; then
        # No arguments - open current directory
        open .
    elif [ -L "$MARKPATH/$1" ]; then
        # Argument is a mark - open the marked path
        open "$MARKPATH/$1"
    else
        # Argument is not a mark - use original behavior
        open "$@"
    fi
}

function z() {
    if [ $# -eq 0 ]; then
        # No arguments - open zed in current directory
        zed .
    elif [ -L "$MARKPATH/$1" ]; then
        # Argument is a mark - open the marked path in zed
        zed "$MARKPATH/$1"
    else
        # Argument is not a mark - use original behavior
        zed "$@"
    fi
}

function k(){
    clear
}


function conf(){
    open "raycast://extensions/raycast/raycast/confetti"
    open -a Ghostty
}


function serve(){
    open "http://localhost:$1"
    python3 -m http.server $1
}

function obs(){
    open "raycast://extensions/marcjulian/obsidian/openVaultCommand"
}

function plist(){
    lsof -i :$1
}

function pkill(){
    kill -9 $1
}



replace_in_clipboard() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: replace_in_clipboard <find_string> <replace_string>"
        return 1
    fi

    local find_string="$1"
    local replace_string="$2"

    # For macOS
    if [[ "$(uname)" == "Darwin" ]]; then
        local clipboard_content=$(pbpaste)
        local modified_content=$(echo "$clipboard_content" | sed -e "s|${find_string}|${replace_string}|g")
        echo "$modified_content" | pbcopy
    # For Linux (requires xclip)
    elif [[ "$(uname)" == "Linux" ]]; then
        local clipboard_content=$(xclip -selection clipboard -o)
        local modified_content=$(echo "$clipboard_content" | sed -e "s|${find_string}|${replace_string}|g")
        echo "$modified_content" | xclip -selection clipboard
    else
        echo "Unsupported operating system"
        return 1
    fi

    echo "Replacement complete. Updated content is now in your clipboard."
}


function nano {
	micro "$@"
}

function n {
	micro "$@"
}

function cat() {
    bat "$@"
}

function q {
	exit
}

function nanoo {
	nano "$@"
}

function rm {
    trash "$@"
    echo "Trashed 🗑️"
}

function rmm {
    rm "$@"
}


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


rzsh() {
    exec zsh
}


# Optimize Atuin settings before initialization
export ATUIN_HISTORY_UPDATE="false"
export ATUIN_HISTORY_LIMIT=5000        # Reduce history items loaded
export ATUIN_AUTO_SYNC="false"         # Disable cloud sync
export ATUIN_UPDATE_CHECK="false"      # Disable update checks
export ATUIN_SYNC_FREQUENCY=0
eval "$(atuin init zsh)"


function mog() {
    mogrify -format jpg -geometry 1300x *.png
}

function ys() {
	yarn start
}

function yt() {
	yarn test
}

function yte() {
	yarn test:e2e
}

function paste() {
    pbpaste > "$1"
}

function copy() {
    if [ $# -eq 0 ]; then
        # No arguments - read from stdin
        pbcopy
    else
        # Arguments provided - copy file contents
        cat "$@" | pbcopy
    fi
}

function gbc() {
    local branch=$(git branch --show-current 2>/dev/null)

    if [ -z "$branch" ]; then
        echo "Error: Not in a git repository or no branch found"
        return 1
    fi

    echo "$branch" | pbcopy
    echo "🎉 Copied $branch"
}



function ship() {
	./deploy.sh "$@"
	echo "🎉 Shipped"
	conf
}


function fullscreen() {
	osascript -e 'tell application "System Events" to keystroke "f" using {command down, control down}'
}

function boo() {
	ghostty +boo
}

function boof() {
	fullscreen
	boo
}

function color_sample() {
	for i in {0..255}; do
	    printf "\033[38;5;${i}m Color $i: ████████ Sample \033[0m\n"
	done
}

function password() {
	openssl rand -hex 32
}

function gt() { 
    git tag "$1" && git push origin "$1" 
}

eval "$(fnm env --use-on-cd --shell zsh)"
