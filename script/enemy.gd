extends CharacterBody2D

var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0,1 * speed)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var v = move_and_collide(velocity * delta)
	if v:
		print("hit")
		var vc = v.get_collider()
		if vc and vc.is_in_group("bullet"):
			vc.get_parent().queue_free()
			
