extends Node2D

@onready var interaction_area = $InteractionArea
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var label = $Label
@onready var timer = $Timer
@onready var fanfare = $Fanfare
@onready var chest_open = $ChestOpen


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	label.hide()

func _on_interact():
	Bgm.stop()
	chest_open.play()
	await chest_open.finished
	fanfare.play()
	animated_sprite_2d.play("open")
	await animated_sprite_2d.animation_finished
	animation_player.play("present")
	timer.start()
	await animation_player.animation_finished
	await fanfare.finished
	Bgm.play()
	queue_free()

func _on_timer_timeout():
	label.show()
