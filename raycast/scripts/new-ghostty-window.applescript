#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Ghostty Window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👻

# Documentation:
# @raycast.author marcjulian
# @raycast.authorURL https://raycast.com/marcjulian


tell application "Ghostty"
	launch
	tell application "System Events"
		tell process "Ghostty"
			click menu item "New Window" of menu "File" of menu bar 1
		end tell
	end tell
end tell

return "Done"
