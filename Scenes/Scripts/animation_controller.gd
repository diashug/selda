extends AnimatedSprite2D

class_name AnimationController

const MOVEMENT_TO_IDLE = {
	"back-walk": "back-idle",
	"front-walk": "front-idle",
	"right-walk": "right-idle",
	"left-walk": "left-idle"
}

func play_movement_animation(velocity: Vector2):
	if velocity.x > 0:
		play("right-walk")
	elif velocity.x < 0:
		play("left-walk")
	
	if velocity.y > 0:
		play("front-walk")
	elif velocity.y < 0:
		play("back-walk")

func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play(MOVEMENT_TO_IDLE[animation])
