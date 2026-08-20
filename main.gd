extends Node2D
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level2.hide()
	$Level3.hide()
	$Level4.hide()
	$Level5.hide()
	$Level6.hide()
	$Level7.hide()
	$Level8.hide()
	$Level9.hide()
	$Level10.hide()
	$GlideDirections.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if level == 2:
		$WalkDirections.hide()
		$GlideDirections.show()
		next_level($Level1,$Level2)
	elif level == 3:
		$GlideDirections.hide()
		next_level($Level2,$Level3)
	elif level == 4:
		next_level($Level3,$Level4)
	elif level == 5:
		next_level($Level4,$Level5)
	elif level == 6:
		next_level($Level5,$Level6)
	elif level == 7:
		next_level($Level6,$Level7)
	elif level == 8:
		next_level($Level7,$Level8)
	elif level == 9:
		next_level($Level88,$Level9)
	elif level == 10:
		next_level($Level9,$Level10)



func next_level(currentlevel, nextlevel):
	currentlevel.hide()
	currentlevel.collision_enabled = false
	nextlevel.show()
	nextlevel.collision_enabled = true

func _on_hud_start() -> void:
	$Ladybug.spawn($PlayerSpawn.position)


func _on_next_level_body_entered(body: Node2D) -> void:
	level += 1
	$Ladybug.spawn($PlayerSpawn.position)
	print(level)
