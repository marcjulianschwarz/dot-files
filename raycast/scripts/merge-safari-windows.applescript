#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Merge Safari
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Merges all safari windows into one window
# @raycast.author marcjulian
# @raycast.authorURL https://raycast.com/marcjulian

log "Merging Safari Windows!"

tell application "Safari"
    set window_count to count of windows
    if window_count is greater than 1 then
        set target_window to window 1

        repeat while (count of windows) > 1
            set current_window to window 2
            set url_list to {}

            # First collect all URLs from the window
            repeat with t in every tab of current_window
                copy (URL of t) to the end of url_list
            end repeat

            # Then create new tabs with the collected URLs
            repeat with current_url in url_list
                tell target_window
                    make new tab with properties {URL:current_url}
                end tell
            end repeat

            close current_window
        end repeat
    end if
    activate
end tell

log "Merge Done."
