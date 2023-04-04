extends CharacterBody2D

@export var speed = 80
@onready var animations = $AnimationPlayer

func handleInput():
	var movementDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movementDirection * speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0:
			direction = "Left"
		if velocity.x > 0:
			direction = "Right"
		if velocity.y < 0:
			direction = "Up"
		animations.play("walk" + direction)
	

func _physics_process(delta):
	handleInput()
	updateAnimation()
	move_and_slide()
