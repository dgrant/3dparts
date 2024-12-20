$fn=128;
h=14.8;
r=4;
union() {
difference(){
  hull(){
      translate([4,4,0]) cylinder(h=h,r=r);
      translate([36,4,0]) cylinder(h=h,r=r);
      translate([36,15.8,0]) cylinder(h=h,r=r);
      translate([4,15.8,0]) cylinder(h=h,r=r);
  }
  hull() {
      translate([4,4,1.3]) cylinder(h=20, r=1.5);
      translate([36,4,1.3]) cylinder(h=20, r=1.5);
      translate([36,15.8,1.3]) cylinder(h=20, r=1.5);
      translate([4,15.8,1.3]) cylinder(h=20, r=1.5);
  }
}
rotate([180,0,0]) translate([0,-19.8,-0.01]) difference(){
  hull(){
      translate([4,4,0]) cylinder(h=14.8,r=r);
      translate([36,4,0]) cylinder(h=14.8,r=r);
      translate([36,15.8,0]) cylinder(h=14.8,r=r);
      translate([4,15.8,0]) cylinder(h=14.8,r=r);
  }
  hull() {
      translate([4,4,1.3]) cylinder(h=20, r=1.5);
      translate([36,4,1.3]) cylinder(h=20, r=1.5);
      translate([36,15.8,1.3]) cylinder(h=20, r=1.5);
      translate([4,15.8,1.3]) cylinder(h=20, r=1.5);
  }
}
}
