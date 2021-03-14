set bluetooth_headphones to "WH-1000XM4"

set btstate to do shell script "/opt/homebrew/bin/blueutil --is-connected " & bluetooth_headphones

if btstate = "1" then
	set val to {" ", "on"}
else
	set val to {" ", "off"}
end if

return val