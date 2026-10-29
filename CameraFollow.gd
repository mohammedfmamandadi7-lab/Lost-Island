extends Camera3D

@export var target: Node3D
@export var follow_speed: float = 5.0

@export var camera_distance: float = 6.0
@export var camera_height: float = 3.0

func _process(delta):

    if target == null:
        return

    var target_position = target.global_position

    var desired_position = target_position + Vector3(
        0,
        camera_height,
        camera_distance
    )

    global_position = global_position.lerp(
        desired_position,
        follow_speed * delta
    )

    look_at(target_position + Vector3(0, 1, 0))
