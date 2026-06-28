extends Area2D

@onready var sprite = $AnimatedSprite2D


func get_coin_key():

	return (
		GameManager.current_level
		+ "_"
		+ str(get_tree().current_scene.scene_file_path)
		+ "_"
		+ str(get_path())
	)


func _ready():

	if GameManager.collected_coins.has(get_coin_key()):

		queue_free()
		return

	sprite.play("idle")

var collected = false
func _on_body_entered(body):

	if collected:
		return

	if not body.is_in_group("player"):
		return

	collected = true

	GameManager.coins += 1

	$CoinSound.play()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

	await $CoinSound.finished

	queue_free()
