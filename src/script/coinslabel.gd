extends Label

func _process(_delta):

	text = str(GameManager.coins) + "/" + str(GameManager.total_coins)
