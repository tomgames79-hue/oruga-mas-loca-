extends CharacterBody2D
class_name Player

var states:Player_states = Player_states.new()
var animations:Player_animations = Player_animations.new()
@onready var state_label: Label = $StateLabel
@onready var anim: AnimationPlayer = $anim
#@export var gravity : float = 10 

@export_category("MOVEMENT")
@export var gravity_scale = 2
@export var speed = 500
@export var acceleration = 1500
@export var friction = 1500
var facing_right = true

@export_category("JUMP")
@export var jump_force = -900
@export var air_acceleration = 2000
@export var air_friction = 500
@onready var coyote_jump: Timer = $coyote_jump

@export_category("COMBAT")
@export var attack : bool = false
@export var health = 5
@export var cooldown = 0.5
@onready var attack_cooldown: Timer = $AttackCooldown

const bullet = preload("res://escenas/bullet.tscn")



var ataque_adquirido := false
var doble_salto_adquirido := false
var dash_adquirido := false
var disparo_adquirido := false

var lista_habilidades_poseidas : Array = ["atacar", "salto_largo"]
var lista_habilidades_equipadas : Array = []

@onready var state_machine: StateMachine = $StateMachine


func _ready() -> void:
	$hit_box/CollisionShape2D.disabled = true
	$Sprite2D/SpriteBrazo.hide()
	anim.play("idle")

func _process(delta: float) -> void:
	if health <= 0:
		get_tree().reload_current_scene()

func _input(event: InputEvent) -> void:
	state_machine.current_state.on_input(event)

func _physics_process(delta: float) -> void:
	state_machine.current_state.on_physic_process(delta)
	flip()
	move_and_slide()
	#state_label.global_position = self.global_position + Vector2(0, -50)
	#var input_axis = Input.get_axis("left","right")
	#
	#apply_gravity(delta)
	#handle_acceleration(input_axis, delta)
	#apply_friction(input_axis, delta)
	#handle_jump()
	#handle_air_acceleration(input_axis, delta)
	#flip()
	#
	#var was_on_floor = is_on_floor()
	#
	##DISPARO
	#if Input.is_action_just_pressed("shoot"):
		#if attack_cooldown.is_stopped():
			#attack_cooldown.start()
			#var shoot = bullet.instantiate()
			#get_parent().add_child(shoot)
			#shoot.position = $Sprite2D.global_position
			#if not facing_right:
				#shoot.scale.x *= -1
				#shoot.velocidad_bullet *= -1
	#
	#move_and_slide()
	#var just_left_edge = was_on_floor and not is_on_floor() and velocity.y >= 0 
	#if just_left_edge:
		#coyote_jump.start()
#
#func apply_gravity(delta):
	#if not is_on_floor():
		#velocity += get_gravity() * gravity_scale * delta 

#func handle_acceleration(input_axis, delta):
	#if not is_on_floor(): return
	#if input_axis != 0:
		#play_animation(Player_animations.walk)
		#velocity.x = move_toward(velocity.x, speed * input_axis, acceleration * delta)
	#else:
		#play_animation(Player_animations.idle)

#func apply_friction(input_axis, delta):
	#if input_axis == 0 and is_on_floor():
		#velocity.x = move_toward(velocity.x, 0, friction * delta)

#func handle_jump():
	#if is_on_floor() or coyote_jump.time_left > 0:
		#if Input.is_action_just_pressed("jump"):
			#velocity.y = jump_force
			#coyote_jump.stop()
			#
	#elif not is_on_floor():
		#if Input.is_action_just_pressed("jump") and velocity.y < jump_force / 2:
			#velocity.y = jump_force / 2



func flip():
	if velocity.x > 0.0:
		facing_right = true
		scale.x = scale.y * 1
	if velocity.x < 0.0:
		facing_right = false
		scale.x = scale.y * -1


func _on_hard_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		print("perdiste vida")
		health -= 1

#func play_animation(animation_name:String):
	#var state_machine: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
	#state_machine.travel(animation_name)
	##anim.play(animation_name)
	##await anim.animation_finished
