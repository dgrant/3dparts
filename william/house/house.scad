width_house = 50;
depth_house = 50;
height_house = 40;
height_roof = 20;
roof_overhang = 3;
wall_thickness = 2;
width_door = 5;
height_door = 15;



module roof() {
    translate([0,depth_house+roof_overhang,height_house])
    rotate(a=90, v=[1,0,0])
    linear_extrude(height=depth_house + 2*roof_overhang)
    polygon(points = [
        [-roof_overhang, 0],
        [width_house/2, height_roof],
        [width_house+roof_overhang, 0]
        ]);
}


module door() {
    translate([width_house/2-width_door/2, -depth_house/2, wall_thickness])
    cube([width_door, depth_house, height_door]);
}


module outside_house() {
    cube([width_house, depth_house, height_house]);
    roof();
}

module inside_house() {
    translate([wall_thickness, wall_thickness, wall_thickness])
    cube([width_house-2*wall_thickness, depth_house-2*wall_thickness, height_house+100]);
}

module house() {
    difference() {
        outside_house();
        inside_house();
        door();
    };
}

roof();
house();