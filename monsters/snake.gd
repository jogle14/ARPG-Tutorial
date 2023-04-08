extends CharacterBody2D

@export var speed = 35
@export var limit = .5
@export var endPoint: Marker2D

@onready var animations = $AnimatedSprite2D

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	
	if moveDirection.length() < limit:
		changeDirection()
	
	velocity = moveDirection.normalized() * speed
	
func updateAnimation():
	var animationString = "walkUp"
	if velocity.x > 0:
		animationString = "walkRight"
	if velocity.x < 0:
		animationString = "walkLeft"
	if velocity.y > 0:
		animationString = "walkDown"
	if velocity.y < 0 && velocity.x != 0:
		animationString = "walkUp"
		
	animations.play(animationString)

func _physics_process(delta):
	updateVelocity()
	updateAnimation()
	move_and_slide()
