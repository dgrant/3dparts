$fn=128;
actualLegWidth=88;
legWidthWithSlop=actualLegWidth+1;
thinWallThickness=1;
outerDim=legWidthWithSlop + 2*thinWallThickness;
depressionDepth=2;
heightGain=24/2;
totalHeight=heightGain+depressionDepth;
squareHeight=totalHeight-depressionDepth-0.2;
bottomPartHeight=totalHeight-squareHeight;
echo("legWidthWithSlop=", legWidthWithSlop);
echo("outerDim=", outerDim);
echo("depressionDepth=", depressionDepth);
echo("heightGain=", heightGain);
echo("totalHeight=", totalHeight);
echo("squareHeight=", squareHeight);
echo("bottomPartHeight=", bottomPartHeight);

difference() {

   union() {
        translate([0,0,squareHeight/2]) cube([outerDim, outerDim, squareHeight], center=true);

        translate([0,0,-bottomPartHeight/2+0.01]) cube([actualLegWidth, actualLegWidth, bottomPartHeight], center=true);
    }

    translate([0,0,depressionDepth/2+(squareHeight-depressionDepth)+10/2]) cube([legWidthWithSlop, legWidthWithSlop, depressionDepth+10], center=true);    
}