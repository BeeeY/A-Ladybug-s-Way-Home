extends Node2D

var level = 1

signal win

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level2.hide()
	$Level3.hide()
	$Level4.hide()
	$Level5.hide()
	$Level6.hide()
	$Level7.hide()
	$Level8.hide()
	$GlideDirections.hide()
	$GlideDirections2.hide()
	$HouseBackground.hide()
	$Thanks.hide()
	
	$Level2.collision_enabled = false
	$Level3.collision_enabled = false
	$Level4.collision_enabled = false
	$Level5.collision_enabled = false
	$Level6.collision_enabled = false
	$Level7.collision_enabled = false
	$Level8.collision_enabled = false
	
	$FlowerSpring2.disable()
	$FlowerSpring3.disable()
	$FlowerSpring4.disable()
	$FlowerSpring5.disable()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if level == 2:
		$WalkDirections.hide()
		$GlideDirections.show()
		$FlowerSpring.disable()
		next_level($Level1,$Level2)

	elif level == 3:
		$GlideDirections.hide()
		$FlowerSpring2.enable()
		$FlowerSpring3.enable()
		$FlowerSpring4.enable()
		next_level($Level2,$Level3)
		
	elif level == 4:
		$FlowerSpring3.disable()
		$FlowerSpring4.disable()
		next_level($Level3,$Level4)
		
	elif level == 5:
		$GlideDirections2.show()
		$FlowerSpring2.disable()
		$FlowerSpring.enable()
		$FlowerSpring3.enable()
		next_level($Level4,$Level5)
		
	elif level == 6:
		$GlideDirections2.hide()
		$FlowerSpring3.disable()
		$FlowerSpring.disable()
		$FlowerSpring2.enable()
		next_level($Level5,$Level6)

	elif level == 7:
		$FlowerSpring2.enable()
		$FlowerSpring3.enable()
		$FlowerSpring5.enable()
		next_level($Level6,$Level7)
		
	elif level == 8:
		$FlowerSpring2.disable()
		$FlowerSpring3.disable()
		$FlowerSpring5.disable()
		$HouseBackground.show()
		next_level($Level7,$Level8)

func next_level(currentlevel, nextlevel):
	currentlevel.hide()
	currentlevel.collision_enabled = false
	nextlevel.show()
	nextlevel.collision_enabled = true

func _on_hud_start() -> void:
	$Cutscene/AnimationPlayer.play("prologue")
	await get_tree().create_timer(3).timeout
	$Cutscene/Ladybug/Emotes.animation = "Happy"
	$Cutscene/Ladybug/Emotes.show()
	await get_tree().create_timer(1.5).timeout
	$Cutscene/Ladybug/Emotes.animation = "Surprise"
	await get_tree().create_timer(1).timeout
	$Cutscene/Ladybug/Emotes.hide()
	
func _on_cutscene_start_game() -> void:
	$Cutscene.hide()
	$Ladybug.spawn($FirstSpawn.position)
		
func _on_next_level_body_entered(body: Node2D) -> void:
	level += 1
	$Ladybug.spawn($PlayerSpawn.position)


func _on_ladybug_death() -> void:
	$Ladybug.spawn($PlayerSpawn.position)


func _on_home_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and level == 8:
		$Ladybug/Emotes.animation = "Heart"
		$Ladybug/Emotes.show()
		$Ladybug.set_physics_process(false)
		$Ladybug.spawn($ThankYou.position)
		$Thanks.show()
		win.emit()
