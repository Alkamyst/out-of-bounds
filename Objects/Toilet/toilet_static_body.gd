extends StaticBody3D

var has_tp: bool = false
var can_pickup: bool = true

func clicked():
	if not Globals.have_tp and has_tp and can_pickup:
		Globals.have_tp = true
		%"Toilet Paper Toilet".visible = false
		has_tp = false
		%TPAudio.play()
	elif Globals.have_tp and not has_tp and can_pickup:
		Globals.have_tp = false
		%"Toilet Paper Toilet".visible = true
		has_tp = true
		%TPAudio.play()
