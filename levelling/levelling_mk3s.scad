$fn=100;

THICKNESS = 0.2; //Square / outline thickness
SIZE = 75;
GAP = 50;
translate([-(SIZE+GAP/2),-(SIZE/2),0]) cube([SIZE,SIZE,THICKNESS]);
translate([GAP/2,-(SIZE/2),0]) cube([SIZE,SIZE,THICKNESS]);