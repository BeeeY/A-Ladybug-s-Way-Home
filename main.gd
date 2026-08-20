extends Node2D
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ladybug.spawn($PlayerSpawn.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hud_start() -> void:
	pass # Replace with function body.


func _on_next_level_body_entered(body: Node2D) -> void:
	level += 1
	
