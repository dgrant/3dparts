$fa=2;
$fs=1;

inches_in_mm = 25.4;

width_of_pipe_in = 4.5;
height_of_pipe_in = 2.5;

width_of_pipe_mm = width_of_pipe_in * inches_in_mm;
height_of_pipe_mm = height_of_pipe_in * inches_in_mm;

thickness_of_wall = 5; //mm
distance_from_pipe = 10; //mm

rounding_size = 2;
distance_from_wall = 10;

module cover_outside() {
    cylinder(h=height_of_pipe_mm + distance_from_pipe + thickness_of_wall - rounding_size, r=width_of_pipe_mm/2 + distance_from_pipe + thickness_of_wall - rounding_size);
}

module cover_inside() {
    translate([0,0,-100]) cylinder(h=height_of_pipe_mm + distance_from_pipe + 100 + rounding_size, r=width_of_pipe_mm/2 + distance_from_pipe + rounding_size);
}

module wall() {
    translate([-100,width_of_pipe_mm/2-distance_from_wall,-50]) cube([200,100,200]);
}

module cover() {
    difference() {
        cover_outside();
        cover_inside();
        wall();
    }
}

module pipe() {
    cylinder(h=height_of_pipe_mm, r=width_of_pipe_mm/2);
}


*wall();
*cover_inside();
minkowski() {
    cover();
    sphere(rounding_size);
}
#pipe();