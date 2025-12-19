extends CharacterBody2D
class_name Player

var states:Player_states = Player_states.new()
var animations:Player_animations = Player_animations.new()
@onready var state_label: Label = $StateLabel
@onready var anim: AnimationPlayer = $anim
@onready var attack_sound: AudioStreamPlayer = $attack
@onready var walk_sound: AudioStreamPlayer = $walk
@onready var shoot_sound: AudioStreamPlayer = $shoot
@onready var powerup: AudioStreamPlayer = $Huevo


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
@export var hurt : ShaderMaterial
@export var invulnerability_time: float = 0.8
@onready var attack_cooldown: Timer = $AttackCooldown
@onready var invulnerability_timer: Timer = $InvulnerabilityTimer
var is_invulnerable: bool = false

@export_category("EGGS")
@export var jump_egg = false
@export var attack_egg = false
@export var shoot_egg = false
const bullet = preload("res://escenas/bullet.tscn")


@onready var state_machine: StateMachine = $StateMachine


func _ready() -> void:
	if GameGlobals.player_position: 
		global_position = GameGlobals.player_position 
	$"../GUI".actualizar_vida(health)
	$hit_box/CollisionShape2D.disabled = true
	$Sprite2D/SpriteBrazo.hide()
	anim.play("idle")


func _process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	state_machine.current_state.on_input(event)

func _physics_process(delta: float) -> void:
	state_machine.current_state.on_physic_process(delta)
	flip()
	move_and_slide()









func flip():
	if velocity.x > 0.0:
		facing_right = true
		scale.x = scale.y * 1
	if velocity.x < 0.0:
		facing_right = false
		scale.x = scale.y * -1


func _on_hard_box_area_entered(area: Area2D) -> void:
	if is_invulnerable:
		return
	if area.is_in_group("enemy_attack"):
		_perder_vida()
		if health <= 0:
			get_tree().call_deferred("reload_current_scene")
			
			
			start_invulnerability()
		

func start_invulnerability():
	is_invulnerable = true
	invulnerability_timer.start(invulnerability_time)
	
	$Sprite2D.material = hurt
	$"daño".start()  

func disparo():
	#if Input.is_action_just_pressed("shoot"):
		if attack_cooldown.is_stopped():
			attack_cooldown.start()
			var shoot = bullet.instantiate()
			get_parent().add_child(shoot)
			shoot.position = $Sprite2D.global_position
			if not facing_right:
				shoot.scale.x *= -1
				shoot.velocidad_bullet *= -1


func apply_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * gravity_scale * delta 

func update_life():
	$"../GUI".actualizar_vida(health)
	$Sprite2D.material = hurt
	$"daño".start()



func _on_daño_timeout() -> void:
		$Sprite2D.material = null
	

func _perder_vida():
	if not is_invulnerable:  # 
		health -= 1
		start_invulnerability()
		update_life()


func _on_invulnerability_timer_timeout() -> void:
	is_invulnerable = false
