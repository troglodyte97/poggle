extends Area2D

class_name DeletionArea

signal deleted_ball


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	deleted_ball.emit()
