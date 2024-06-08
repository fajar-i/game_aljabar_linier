extends Node2D

@onready var peta = $"../TileMap"
var putih: bool = false
var merah
var kuning
var biru

func _ready():
	pass
	
func bergerak(arah: Vector2i):
	#lokasi saat ini dalam format Vector2
	var current_tile: Vector2i = peta.local_to_map(global_position)
	#lokasi yang ingin dituju dalam format Vector2
	var target_tile: Vector2i = Vector2i(
		current_tile.x + arah.x,
		current_tile.y + arah.y,
	)
	
	global_position = peta.map_to_local(target_tile)
	print(peta.local_to_map(global_position))
	
	cek_item(target_tile)
	
func _on_kuning_pressed():
	if (putih):
		kuning = Vector2i(-3, 0)
	else:
		kuning = Vector2i(3, 0)
	
	bergerak(kuning)

func _on_merah_pressed():
	if (putih):
		merah = Vector2(1, 1)
	else:
		merah = Vector2(-1, -1)
	
	bergerak(merah)

func _on_biru_pressed():
	if (putih):
		merah = Vector2(-2, -1)
	else:
		merah = Vector2(2, 1)
	
	bergerak(merah)

func _on_putih_toggled(toggled_on):
	if toggled_on:
		putih = true
	else:
		putih = false


func cek_item(target_tile):
	var tile_data: TileData = peta.get_cell_tile_data(1, target_tile)
	#print(tile_data.get_custom_data("item"))
	
	if tile_data != null:
		print(tile_data.get_custom_data("item"))
		peta.erase_cell(1, target_tile)
	

