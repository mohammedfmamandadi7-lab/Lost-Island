extends CanvasLayer

func _ready():
    create_button("↑", Vector2(100, -180), "ui_up")
    create_button("↓", Vector2(100, -90), "ui_down")
    create_button("←", Vector2(10, -135), "ui_left")
    create_button("→", Vector2(190, -135), "ui_right")

    create_button("JUMP", Vector2(-180, -180), "ui_accept")
    create_button("RUN", Vector2(-180, -90), "sprint")


func create_button(title, pos, action):

    var button = Button.new()

    button.text = title
    button.custom_minimum_size = Vector2(80, 65)

    add_child(button)

    button.anchor_left = 1.0 if pos.x < 0 else 0.0
    button.anchor_right = 1.0 if pos.x < 0 else 0.0

    button.anchor_top = 1.0
    button.anchor_bottom = 1.0

    button.position = pos

    button.button_down.connect(
        func(): Input.action_press(action)
    )

    button.button_up.connect(
        func(): Input.action_release(action)
    )
