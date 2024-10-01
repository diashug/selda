extends Node2D

class_name CombatSystem

@onready var animated_sprite_2d: AnimationController = %AnimatedSprite2D

func _input(event):
	if Input.is_action_just_pressed("right_hand_action") or Input.is_action_just_pressed("left_hand_action"):
		animated_sprite_2d.play_attack_animation()
	else:
		animated_sprite_2d.play_attack_to_idle_animation()
