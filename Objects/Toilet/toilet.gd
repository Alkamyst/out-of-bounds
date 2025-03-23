extends Node3D

@onready var toilet_sb = $ToiletStaticBody

func flush():
	if not toilet_sb.has_tp:
		$Flusher/FlusherAnimation.play("new_animation")
		tp_cannot_pickup()
	else:
		$Flusher/FlusherAnimation.play("flush2")
		tp_cannot_pickup()
	%FlushSound.play()

func delete():
	const EXPLOSION = preload("res://Objects/Explosion/explosion.tscn")
	var new_explosion = EXPLOSION.instantiate()
	new_explosion.global_position = global_position
	get_tree().get_root().add_child(new_explosion)
	
	const HAND = preload("res://Objects/Clock/hour_hand.tscn")
	var new_hand = HAND.instantiate()
	new_hand.global_position = global_position
	new_hand.rotation_degrees.y = 30
	get_tree().get_root().add_child(new_hand)
	queue_free()

func tp_cannot_pickup():
	toilet_sb.can_pickup = false
	
func tp_can_pickup():
	toilet_sb.can_pickup = true
