$fn=200;

volume=8000.0;

// regular dodecahedron
phi = (1 + sqrt(5))/2;

// edge length
edge_length = pow(volume / 7.6631189606, 1/3);
echo("edge length=", edge_length);

// radius of outer sphere
r = edge_length * 1.401258538;
echo("radius=", r);

// scale factor, because r is half-diagonal of quarter-cube
a = r/sqrt(3);
echo("a=", a);

calculated_volume = 7.6631189606 * pow(edge_length, 3);
echo("calculated volume=", calculated_volume);

s0 = [a,a,a];
s1 = [a,a,-a];
s2 = [a,-a,a];
s3 = [a,-a,-a];
s4 = [-a,a,a];
s5 = [-a,a,-a];
s6 = [-a,-a,a];
s7 = [-a,-a,-a];

// See: https://en.wikipedia.org/wiki/Regular_dodecahedron#Cartesian_coordinates
// For what is meant by green, blue, pink

g0 = [0, a*phi, a*(1/phi)]; // top back green 8
g1 = [0, a*phi, -a*(1/phi)]; // bottom back green 9
g2 = [0, -a*phi, a*(1/phi)]; // top front green 10
g3 = [0, -a*phi, -a*(1/phi)]; // bottom front green 11

b0 = [a*(1/phi), 0, a*phi]; // top right blue 12
b1 = [-a*(1/phi), 0, a*phi]; // top left blue 13
b2 = [a*(1/phi), 0, -a*phi]; // bottom right blue 14
b3 = [-a*(1/phi), 0, -a*phi]; // bottom left blue 15

p0 = [a*phi, a*(1/phi), 0]; // right back pink 16
p1 = [a*phi, -a*(1/phi), 0]; // right front pink 17
p2 = [-a*phi, a*(1/phi), 0]; // left back pink 18
p3 = [-a*phi, -a*(1/phi), 0]; // left front pink 19

 
color([0,1,0,0.9]) polyhedron(
    [ s0,s1,s2,s3,s4,s5,s6,s7,g0,g1,g2,g3,b0,b1,b2,b3,p0,p1,p2,p3 ],
  [
        // front dome
        [2,17,3,11,10],
        [11,10,6,19,7],
        // back dome
        [0,16,1,9,8],
        [9,8,4,18,5],
        // top dome
        [2,10,6,13,12],
        [13,12,0,8,4],
        // bottom dome,
        [3,11,7,15,14],
        [15,14,1,9,5],
        // right dome
        [2,12,0,16,17],
        [16,17,3,14,1],
        // left dome
        [6,13,4,18,19],
        [18,19,7,15,5]
        ]
  );

dihedral_angle = 2 * atan((1 + sqrt(5))/2);
echo("dihedral_angle=", dihedral_angle);
echo("180-dihedral_angle=", 180-dihedral_angle);
