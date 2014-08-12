$fn=128;
heightOfBlock=62;
widthOfBlock=51;
thicknessOfBlock=26;

holeWidth=widthOfBlock+1;
holeThickness=thicknessOfBlock+1;

totalHeight=0.8*heightOfBlock;
wallThickness=2;
outerRectangleWidth=holeWidth+2*wallThickness;
outerRectangleThickness=holeThickness+2*wallThickness;
circleRadius=sqrt(pow(outerRectangleWidth/2,2) + pow(outerRectangleThickness/2,2));
echo("circleRadius=", circleRadius);

//difference() {
//  union() {
//    translate([-outerRectangleWidth/2, -outerRectangleThickness/2, 0]) cube([outerRectangleWidth, outerRectangleThickness, totalHeight]);
    //cylinder(r=circleRadius, h=2);
//  }
//  translate([-holeWidth/2, -holeThickness/2, -5]) cube([holeWidth, holeThickness, totalHeight+10]);
//}

curvature=2;
totalYBottomSupport=outerRectangleWidth;
totalXBottomSupport=outerRectangleWidth;
totalZBottomSupport=2;

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