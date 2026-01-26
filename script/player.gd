extends CharacterBody2D

var speed = 400

var bullet_scene = preload("res://scene/bullet.tscn")

var shoot_rate = 0.5
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func get_input():
	var d_X = Input.get_axis("left","right")
	var input_direction = Vector2(d_X * speed  , 0)
	velocity = input_direction
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	if can_shoot == false:
		return
	create_bullet()
	can_shoot = false
	await get_tree().create_timer(shoot_rate).timeout
	can_shoot = true
	

func create_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.position.y = position.y - 64/2 - 8
	bullet.position.x = position.x
	get_tree().current_scene.add_child(bullet)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
