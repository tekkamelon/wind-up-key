a = 1.7;//stick radius
b = 2.9;//joint diameter
c = 1.5;//handle thickness
d = 7;//handle radius
e = 55;//handle polygon
f = 3;//handle hole radius
x = 7;//handle x
y = 8;//handle y
z = c/2;//handle z

module stick(){
    union(){
        rotate([0,90,0]){
            cylinder(h = 25, r = a, $fn = 40);
            cylinder(h = 28.5, d = b, $fn = 12);//diameter
        }
    }
}

module L_handle(){
    difference(){
        translate([x,-y,-z]){
            cylinder(h = c, r = d, $fn = e+5);
        }
        translate([x,-y,-z]){
            cylinder(h = c, r = f, $fn = e);
        }   
    }
}

module R_handle(){
    mirror([0,1,0]){
        L_handle();
    }
}

union(){
   stick();
   L_handle();
   R_handle();
}