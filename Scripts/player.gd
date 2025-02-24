extends CharacterBody2D

var speed = 100.0
var direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO  # Resetear dirección cada frame
	
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1

	velocity = direction * speed 
	move_and_slide() 
