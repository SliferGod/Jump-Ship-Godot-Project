extends Node2D

#Based State Machine
var state : String = "MOVEMENT"
#Movement
@export var speed : float = 500
var speedBuildUp : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == "MOVEMENT":
		_Movement(delta)
	else:
		print("YOUR STATE IS INVALID BUT THATS OKAY, I BELIEVE IN YOU!!!!!")

func _Movement(delta):
	var direction = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	position.x += direction * speed * delta * speedBuildUp
	if direction and speedBuildUp <= 1.5:
		speedBuildUp += delta
	elif not direction:
		speedBuildUp = 1
