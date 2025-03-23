extends StaticBody3D

var has_tp: bool = true

func clicked():
	if not Globals.have_tp and has_tp:
		Globals.have_tp = true
		%"Toilet Paper Handle".visible = false
		has_tp = false
		%TPAudio.play()
	elif  Globals.have_tp and not has_tp:
		Globals.have_tp = false
		%"Toilet Paper Handle".visible = true
		has_tp = true
		%TPAudio.play()
