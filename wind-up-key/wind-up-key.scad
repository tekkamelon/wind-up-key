a = 1.7;//stick radius
b = 2.9;//joint diameter
c = 1.5;//handle thickness
d = 7;//handle radius
e = 55;//handle polygon
f = 3;//handle hole radius
x = 7;//handle x
y = 8;//handle y
z = c/2;//handle z

module target(){
    union(){
    //stick
        rotate([0,90,0]){
            cylinder(h = 25, r = a, $fn = 40);
        }
    //joint
        rotate([0,90,0]){
            cylinder(h = 28.5, d = b, $fn = 12);//diameter
        }
        
    //handle L
        translate([x,-y,-z]){
            cylinder(h = c, r = d, $fn = e+5);
        }
            
    //handle R
        translate([x,y,-z]){
            cylinder(h = c, r = d, $fn = e+5);
        }
    }
}

module tool(){
    //hole L
        translate([x,-y,-z]){
            cylinder(h = c, r = f, $fn = e);
     }

    //hole R
        translate([x,y,-z]){
            cylinder(h = c, r = f, $fn = e);
         }
     }
        
difference(){
    target();
    tool();
    }