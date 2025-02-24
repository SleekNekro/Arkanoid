extends CharacterBody2D

@export var speed = Vector2(15, -15)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(speed * delta)
	
	if collision:
		var collider = collision.get_collider()
		print(collider)
		print(position)
		
		
		if collider and collider.name == "Barra": 
			var player = collider
			
			var distance = position.x - player.position.x
			var width = player.get_node("Sprite2D").texture.get_size().x / 2
			
			var relation = distance / width
			relation = clamp(distance / width, -1.0, 1.0)
			
			var angle = relation * 45
			var angle_rad = deg_to_rad(angle)
			
			speed = speed.bounce(collision.get_normal()).rotated(angle_rad) 
			speed *= 1.2  
			speed = speed.limit_length(500) 
			print(speed)
		# Si colisiona con un ladrillo
		elif collider and collider.is_in_group("bricks"):
			collider.queue_free()  # Elimina el ladrillo
			speed = speed.bounce(collision.get_normal())

	
		else:
			speed = speed.bounce(collision.get_normal())

			if abs(speed.y)<2:
				var correction = deg_to_rad(randi_range(10,-15))*sign(speed.x)
				speed = speed.rotated(correction)
