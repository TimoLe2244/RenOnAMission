extends Sprite2D

@onready var interaction_area = $InteractionArea
@onready var animation_player = $AnimationPlayer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var label = $"../Label"
@onready var timer = $Timer



func _ready():
	label.hide()
	interaction_area.interact = Callable(self, "_on_interact")
	animation_player.play("idle")

func _on_interact():
	animation_player.play("on_interact")
	audio_stream_player_2d.play()
	timer.start()
	await animation_player.animation_finished
	
	
func _on_timer_timeout():
	label.show()
