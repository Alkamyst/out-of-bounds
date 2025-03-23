extends StaticBody3D

func _process(delta: float) -> void:
	if Globals.have_hand:
		$CollisionShape3D.disabled = false

func clicked():
	Globals.have_hand = false
	$"../Clock/HourHand/HandStaticBody/CollisionShape3D".disabled = false
	$"../Clock/HourHand".visible = true
	$"../../Audio_Turn".play()
	queue_free()
