extends AnimatedSprite2D

class_name AnimationController

signal attack_animation_finished

const MOVEMENT_TO_IDLE = {
	"back-walk": "back-idle",
	"front-walk": "front-idle",
	"right-walk": "right-idle",
	"left-walk": "left-idle"
}

const DIRECTION_TO_ATTACK_ANIMATION = {
	"back": "back-attack",
	"front": "front-attack",
	"right": "right-attack",
	"left": "left-attack"
}

const DIRECTION_TO_ATTACK_VECTOR = {
	"back": Vector2(0, -1),
	"front": Vector2(0, 1),
	"right": Vector2(1, 0),
	"left": Vector2(-1, 0)
}

var attack_direction = null
var item_eject_direction = Vector2.DOWN

func play_movement_animation(velocity: Vector2):
	if velocity.x > 0:
		item_eject_direction = Vector2.RIGHT
		play("right-walk")
	elif velocity.x < 0:
		item_eject_direction = Vector2.LEFT
		play("left-walk")
	
	if velocity.y > 0:
		item_eject_direction = Vector2.DOWN
		play("front-walk")
	elif velocity.y < 0:
		item_eject_direction = Vector2.UP
		play("back-walk")

func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play(MOVEMENT_TO_IDLE[animation])

func play_attack_animation():
	var direction = animation.split("-")[0]
	attack_direction = direction
	play(DIRECTION_TO_ATTACK_ANIMATION[direction])

func play_attack_to_idle_animation():
	if DIRECTION_TO_ATTACK_ANIMATION.values().has(animation):
		var animation_string = String(animation)
		var direction = DIRECTION_TO_ATTACK_ANIMATION.find_key(animation_string)
		play(direction + "-idle")
		attack_direction = null
		attack_animation_finished.emit()
