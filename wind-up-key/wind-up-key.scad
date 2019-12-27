a = 1.7;//stick radius
b = 2.9;//joint diameter
c = 1.5;//handle thickness
d = 7;//handle radius
e = 55;//handle polygon
f = 3;//handle hole radius
x = 7;//handle x
z = c/2;//handle z

module stick(){
    union(){
        rotate([0,90,0]){
            cylinder(h = 25, r = a, $fn = 40);
            cylinder(h = 28.5, d = b, $fn = 12);//diameter
        }
    }
}

module handle(){
    for(y = [-8:16:8]){
        difference(){
            translate([x,y,-z]){
                cylinder(h = c, r = d, $fn = e+5);
            }
            translate([x,y,-z]){
                cylinder(h = c, r = f, $fn = e);
            }
        }
    }
}

union(){
   stick();
   handle();
}