extends Area2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("idle")

func _on_body_entered(_body):
	animation_player.play("pickup")
	
