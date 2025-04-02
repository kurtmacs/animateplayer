extends Area2D

@export var speed: float = 200.0

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	var direction := Vector2.ZERO
	var is_moving = false
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animated_sprite.flip_h = false
		is_moving = true
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animated_sprite.flip_h = true
		is_moving = true
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		is_moving = true
	
	if is_moving:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("stand")
	
	if direction != Vector2.ZERO:
		position += direction * speed * delta
