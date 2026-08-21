extends Node2D

signal flower_sprung

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		flower_sprung.emit()
		$AnimatedSprite2D.animation = "PartlySprung"
		await get_tree().create_timer(0.1).timeout
		$AnimatedSprite2D.animation = "Sprung"
		await get_tree().create_timer(0.3).timeout
		$AnimatedSprite2D.animation = "PartlySprung"
		await get_tree().create_timer(0.2).timeout
		$AnimatedSprite2D.animation = "Unsprung"
	
func disable():
	$Area2D.monitoring = false
	hide()
	
func enable():
	$Area2D.monitoring = true
	show()
