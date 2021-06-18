
if application "Spotify" is running then
	tell application "Spotify"
		return (artist of current track) & " – " & (name of current track)
	end tell
end if
