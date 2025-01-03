extends Control

@onready var score = Game.score
@onready var label_text = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	label_text.text = 'Score: ' + str(Game.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label_text.text = 'Score: ' + str(Game.score)
