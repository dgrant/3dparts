$fn=128;
heightOfBlock=62;
widthOfBlock=51;
thicknessOfBlock=26;

holeWidth=widthOfBlock+1;
holeThickness=thicknessOfBlock+1;

totalHeight=0.8*heightOfBlock;
wallThickness=2;
outerRectangleWidth=holeWidth+2*wallThickness;
echo("outerRectangleWidth=", outerRectangleWidth);
outerRectangleThickness=holeThickness+2*wallThickness;
circleRadius=sqrt(pow(outerRectangleWidth/2,2) + pow(outerRectangleThickness/2,2));
echo("circleRadius=", circleRadius);

curvature=2;
// bigger base:
//totalYBottomSupport=circleRadius*2;
// smaller base
totalYBottomSupport=outerRectangleWidth;

totalXBottomSupport=outerRectangleWidth;
totalZBottomSupport=wallThickness;

echo("outerRectangleWidth=", outerRectangleWidth);

module widget() {
difference() {
  union() {
    hull() {
        translate([totalXBottomSupport/2-curvature, totalYBottomSupport/2-curvature, 0]) cylinder(h=totalZBottomSupport, r=curvature);
        translate([-(totalXBottomSupport/2-curvature), totalYBottomSupport/2-curvature, 0]) cylinder(h=totalZBottomSupport, r=curvature);
        translate([-(totalXBottomSupport/2-curvature), -(totalYBottomSupport/2-curvature), 0]) cylinder(h=totalZBottomSupport, r=curvature);
        translate([totalXBottomSupport/2-curvature, -(totalYBottomSupport/2-curvature), 0]) cylinder(h=totalZBottomSupport, r=curvature);
    }
    hull() {
        translate([outerRectangleWidth/2-curvature, outerRectangleThickness/2-curvature,0]) cylinder(r=curvature, h=totalHeight);
        translate([-(outerRectangleWidth/2-curvature), outerRectangleThickness/2-curvature,0]) cylinder(r=curvature, h=totalHeight);
        translate([-(outerRectangleWidth/2-curvature), -(outerRectangleThickness/2-curvature),0]) cylinder(r=curvature, h=totalHeight);
        translate([outerRectangleWidth/2-curvature, -(outerRectangleThickness/2-curvature),0]) cylinder(r=curvature, h=totalHeight);
    }
  }
   translate([-holeWidth/2, -holeThickness/2, -5]) cube([holeWidth, holeThickness, totalHeight+10]);
}
}

spacing=1;

union() {

translate([outerRectangleWidth/2 + spacing, totalYBottomSupport/2 + spacing, 0]) widget();
translate([-(outerRectangleWidth/2+spacing), totalYBottomSupport/2+spacing, 0]) widget();
translate([-(outerRectangleWidth/2+spacing), -(totalYBottomSupport/2+spacing), 0]) widget();
translate([outerRectangleWidth/2+spacing, -(totalYBottomSupport/2+spacing), 0]) widget();

translate([0,0,0.5]) rotate([90,90,45]) cube([1,1,10], center=true);
translate([0,0,0.5]) rotate([90,90,-45]) cube([1,1,10], center=true);

}