extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizePixel = mapRect.size * tileSize
	limit_right = worldSizePixel.x
	limit_bottom = worldSizePixel.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
