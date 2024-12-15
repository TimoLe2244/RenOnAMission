extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var interaction_area = $InteractionArea
@onready var timer = $Timer
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()
	animation_player.play("idle")
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	timer.start()
	animation_player.play("on_interact")
	await animation_player.animation_finished
	queue_free()
	
func _on_timer_timeout():
	label.show()
