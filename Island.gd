extends Node3D

@export var island_size = 100.0
@export var tree_count = 80

func _ready():
    create_ground()
    create_trees()

func create_ground():
    var ground = MeshInstance3D.new()
    var mesh = PlaneMesh.new()

    mesh.size = Vector2(island_size, island_size)
    ground.mesh = mesh

    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0.25, 0.45, 0.18)

    ground.material_override = material
    add_child(ground)

    var collision = StaticBody3D.new()
    var shape = CollisionShape3D.new()
    var box = BoxShape3D.new()

    box.size = Vector3(island_size, 1, island_size)
    shape.shape = box
    shape.position.y = -0.5

    collision.add_child(shape)
    add_child(collision)

func create_trees():
    for i in range(tree_count):
        var tree = Node3D.new()

        var trunk = MeshInstance3D.new()
        var trunk_mesh = CylinderMesh.new()

        trunk_mesh.top_radius = 0.15
        trunk_mesh.bottom_radius = 0.25
        trunk_mesh.height = 2.5

        trunk.mesh = trunk_mesh
        trunk.position.y = 1.25

        var leaves = MeshInstance3D.new()
        var leaves_mesh = SphereMesh.new()

        leaves_mesh.radius = 1.2
        leaves_mesh.height = 2.4

        leaves.mesh = leaves_mesh
        leaves.position.y = 3

        var leaf_material = StandardMaterial3D.new()
        leaf_material.albedo_color = Color(0.08, 0.35, 0.12)
        leaves.material_override = leaf_material

        tree.add_child(trunk)
        tree.add_child(leaves)

        tree.position = Vector3(
            randf_range(-island_size / 2, island_size / 2),
            0,
            randf_range(-island_size / 2, island_size / 2)
        )

        add_child(tree)
