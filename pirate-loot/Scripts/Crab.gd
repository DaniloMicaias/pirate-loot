extends KinematicBody2D

export var speed = 64
export var health = 1
var motion = Vector2.ZERO
var gravity = 1200
var move_direction = -1
var hitted = false

func _physics_process(delta: float) -> void:
	motion.x = speed * move_direction
	motion.y += gravity * delta
	
	if move_direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

	_set_animation()
	
	motion = move_and_slide(motion)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "idle":
		$AnimatedSprite.flip_h != $AnimatedSprite.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$AnimatedSprite.play("run")

#Funcao para controlar as animacoes
func _set_animation():
	var anim = "run"
	
	if$ray_wall.is_colliding():
		$AnimatedSprite.play("idle")
	elif motion.x != 0 :
		$AnimatedSprite.play("run")
	
	if hitted:
		$AnimatedSprite.play("hit")


func _on_hitbox_body_entered(body):
	hitted = true
	yield(get_tree().create_timer(0.2), "timeout")
	hitted = false
