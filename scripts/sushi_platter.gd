extends Node2D

@onready var interaction_area = $InteractionArea
@onready var animation_player = $AnimationPlayer
@onready var message_timer = $MessageTimer
@onready var message = $Message
@onready var cooking_sounds = $CookingSounds


# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	message.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_interact():
	cooking_sounds.play()
	message_timer.start()
	animation_player.play("on_interact")
	await animation_player.animation_finished
	queue_free()
	
func _on_timer_timeout():
	message.show()
	
