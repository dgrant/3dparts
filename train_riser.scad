$fn=128;
heightOfBlock=62;
widthOfBlock=51;
thicknessOfBlock=26;

holeWidth=widthOfBlock+1;
holeThickness=thicknessOfBlock+1;

totalHeight=0.7*heightOfBlock;
wallThickness=2;
outerRectangleWidth=holeWidth+2*wallThickness;
outerRectangleThickness=holeThickness+2*wallThickness;
circleRadius=sqrt(pow(outerRectangleWidth/2,2) + pow(outerRectangleThickness/2,2));

difference() {
  union() {
    translate([-outerRectangleWidth/2, -outerRectangleThickness/2, 0]) cube([outerRectangleWidth, outerRectangleThickness, totalHeight]);
    cylinder(r=circleRadius, h=2);
  }
  translate([-holeWidth/2, -holeThickness/2, -5]) cube([holeWidth, holeThickness, totalHeight+10]);

}