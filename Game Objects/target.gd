extends Sprite2D

var rng = RandomNumberGenerator.new()
var input_handled = false  # Flag to prevent multiple events

func rng_x() -> int:
	return rng.randi_range(0, 1140)

func rng_y() -> int:
	return rng.randi_range(100, 525)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()

func _process(_delta: float) -> void:
	pass

func _on_area_2d_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not input_handled:
		input_handled = true  # Mark event as handled
		var x_num = rng_x()
		var y_num = rng_y()
		Game.increase_score(70)  # Call the global script to update the score
		self.position = Vector2(x_num, y_num)
		print("Primary Area2D clicked")

		# Reset the flag after a small delay
		await(get_tree().create_timer(0.1))
		input_handled = false

func _on_goodshot_area_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and not input_handled:
		input_handled = true  # Mark event as handled
		var x_num = rng_x()
		var y_num = rng_y()
		Game.increase_score(20)  # Call the global script to update the score
		self.position = Vector2(x_num, y_num)
		print("Goodshot Area2D clicked")

		# Reset the flag after a small delay
		await(get_tree().create_timer(0.1))
		input_handled = false


func _on_fairshot_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not input_handled:
		input_handled = true  # Mark event as handled
		var x_num = rng_x()
		var y_num = rng_y()
		Game.increase_score(10)  # Call the global script to update the score
		self.position = Vector2(x_num, y_num)
		print("Goodshot Area2D clicked")

		# Reset the flag after a small delay
		await(get_tree().create_timer(0.1))
		input_handled = false
