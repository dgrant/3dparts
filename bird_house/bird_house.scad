$fn=100;

wall_thickness = 5;
floor_thickness = 10;
roof_thickness = 10; 

distance_to_first_drain_hole = 2;
drain_hole_spacing = 20;
drain_hole_size = 2;

inside_width = 100; // find right value for this
inside_depth = 100; // find right value for this

hole_diameter = 32; // find right value for this
hole_height_above_floor = 125; // for cats
hole_to_roof = 30;
roof_slope_angle = 10;

outside_width = inside_width + wall_thickness;
outside_depth = inside_depth + wall_thickness;
front_outside_height = floor_thickness + hole_height_above_floor + hole_diameter + hole_to_roof + roof_thickness;
back_outside_height = front_outside_height + tan(roof_slope_angle) * outside_depth;
hole_position_from_bottom = hole_height_above_floor + floor_thickness + hole_diameter/2;

echo("back_outside_height=", back_outside_height);

difference() {
    polyhedron(points=[
        // BOTTOM
        [0,0,0], // 0: front-left corner
        [outside_width, 0, 0], // 1: front-right corner
        [outside_width, outside_depth, 0], // 2: back-right corner
        [0, outside_depth, 0], // 3: back-left corner
        
        // TOP
        [0,0,front_outside_height-20], // 4: front-left corner
        [outside_width, 0, front_outside_height-20], // 5: front-right corner
        [outside_width, outside_depth, back_outside_height-20], // 6: back-right corner
        [0, outside_depth, back_outside_height-20] // 7: back-left corner
        
        ],
        faces=[
        [0,1,2,3], // bottom
        [0,4,5,1], // front
        [4,7,6,5], // top
        [1,5,6,2], // right
        [3,2,6,7], // back
        [0,3,7,4] // left
        ]
        );
    
    // Make hole
    translate([outside_width/2, outside_depth/2, hole_position_from_bottom]) rotate([90,0,0]) cylinder(h=outside_depth, r=hole_diameter/2);
    
    // Make inside
    polyhedron(points=[
        // BOTTOM
        [wall_thickness, wall_thickness, floor_thickness], // 0: front-left corner
        [outside_width-wall_thickness, wall_thickness, floor_thickness], // 1: front-right corner
        [outside_width-wall_thickness, outside_depth-wall_thickness, floor_thickness], // 2: back-right corner
        [0, outside_depth-wall_thickness, floor_thickness], // 3: back-left corner
        
        // TOP
        [wall_thickness,wall_thickness,front_outside_height-roof_thickness], // 4: front-left corner
        [outside_width-wall_thickness, wall_thickness, front_outside_height-roof_thickness], // 5: front-right corner
        [outside_width-wall_thickness, outside_depth-wall_thickness, back_outside_height-roof_thickness], // 6: back-right corner
        [wall_thickness, outside_depth-wall_thickness, back_outside_height-roof_thickness] // 7: back-left corner
        
        ],
        faces=[
        [0,1,2,3], // bottom
        [0,4,5,1], // front
        [4,7,6,5], // top
        [1,5,6,2], // right
        [3,2,6,7], // back
        [0,3,7,4] // left
        ]
        );    

    // Holes in bottom
    for (x = [distance_to_first_drain_hole+wall_thickness:drain_hole_spacing:wall_thickness+inside_width-distance_to_first_drain_hole]) {
        for (y = [distance_to_first_drain_hole+wall_thickness:drain_hole_spacing:wall_thickness+inside_depth-distance_to_first_drain_hole]) {
            color([1,0,0]) translate([x, y, -front_outside_height/2]) cylinder(h=front_outside_height, r=drain_hole_size);
        }
    }
    
    // Vent at back
    

}