#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Finder -> Ghostty
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👻

# Documentation:
# @raycast.author marcjulian
# @raycast.authorURL https://raycast.com/marcjulian


tell application "Finder"
    set currentPath to POSIX path of (target of front window as alias)
end tell

tell application "Ghostty"
    launch
    tell application "System Events"
        tell process "Ghostty"
            click menu item "New Window" of menu "File" of menu bar 1
            delay 0.5
            keystroke "cd " & quoted form of currentPath
            keystroke return
            keystroke "k"
            keystroke return
        end tell
    end tell
end tell

return "Done"
