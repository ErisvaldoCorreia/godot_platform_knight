extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -250.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
var is_dead = false
@onready var collision_shape_2d = $CollisionShape2D

func _physics_process(delta):
	if is_dead:
		collision_shape_2d.disabled = true
		return  # Não processa nada se o player estiver morto
	
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis('move_left', "move_right")
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true 
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	is_dead = true
	animated_sprite_2d.play("died")
