$fs=0.5;
$fa=0.5;

wall_thickness = 5;
floor_thickness = 10;
roof_thickness = 10; 

extra = 10;

distance_to_first_drain_hole = 2;
drain_hole_spacing = 20;
drain_hole_size = 2;

inside_width = 100; // find right value for this
inside_depth = 100; // find right value for this

hole_diameter = 28.5; // for chickadee
hole_height_above_floor = 125; // for cats
hole_to_roof = 20;
roof_slope_angle = 10;

outside_width = inside_width + 2 * wall_thickness;
outside_depth = inside_depth + 2 * wall_thickness;
front_outside_height = floor_thickness + hole_height_above_floor + hole_diameter + hole_to_roof + roof_thickness;
back_outside_height = front_outside_height + tan(roof_slope_angle) * outside_depth;
hole_position_from_bottom = hole_height_above_floor + floor_thickness + hole_diameter/2;

echo("back_outside_height=", back_outside_height);

difference() {
    cube([outside_width, outside_depth, back_outside_height]);
    // Cut out inside
    translate([wall_thickness, wall_thickness, floor_thickness]) cube([inside_width, inside_depth,     back_outside_height + extra]);
    // Cut off top at angle
    translate([-extra, -outside_depth/2, back_outside_height])
    translate([0,2*outside_depth,0]) rotate([roof_slope_angle,0,0]) translate([0,-2*outside_depth,0]) cube([outside_width + 2*extra, 2*outside_depth, 100]);
    // Add entrance hole
    #translate([outside_width/2, extra+wall_thickness/2, hole_height_above_floor+hole_diameter/2]) rotate([90,0,0]) cylinder(r=hole_diameter/2, h=wall_thickness+2*extra);
};