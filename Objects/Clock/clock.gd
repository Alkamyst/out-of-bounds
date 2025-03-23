extends Node3D

@onready var minuteHand = $ClockBack/Clock/MinuteHand/HandStaticBody
@onready var hourHand = $ClockBack/Clock/HourHand/HandStaticBody
var can_interact = true
var opened = false

func _process(delta: float) -> void:
	if minuteHand.pos == minuteHand.pos_needed:
		if hourHand.pos == hourHand.pos_needed:
			if not opened:
				can_interact = false
				$AnimationPlayer.play("open")
				opened = true
