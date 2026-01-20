#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Sort Finder By Name
# @raycast.mode silent

# Optional parameters:
# @raycast.icon🔄

# Documentation:
# @raycast.author marcjulian
# @raycast.authorURL https://raycast.com/marcjulian


tell application "Finder"
	try
		clean up front Finder window
	end try
end tell

return "Done"
