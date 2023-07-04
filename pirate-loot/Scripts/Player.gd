extends KinematicBody2D

var velocity = Vector2.ZERO
var direcao = Vector2(0,0)
var move_speed = 480
var gravity = 1200
var jump_force = -720
var is_grounded
onready var raycasts = $raycasts

#Funcao principal para movimentacao
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	_get_input() 
	
	velocity = move_and_slide(velocity)
	
	is_grounded = _check_is_ground()
	
	_set_animation()

#funcao para andar e controlar a direcao
func _get_input():
	velocity.x = 0
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	direcao.x = Input.get_axis("move_left", "move_right")
	if move_direction !=0:
		$AnimatedSprite.scale.x = move_direction

#funcao para pular  
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") && is_grounded:
		velocity.y = jump_force / 2

#funcao para verificar se o player esta no chao (Evitar o pulo eterno)
func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false

#Funcao para controlar as animacoes
func _set_animation():
	if direcao.x == 0:
		$AnimatedSprite.play("idle")
	elif direcao.x != 0 :
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("jump")
		
	if velocity.y > 0 and !is_grounded:
		$AnimatedSprite.play("fall")
