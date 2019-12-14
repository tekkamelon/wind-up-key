a = 1.7;//stick radius
b = 2.9/2;//joint diameter/2
c = 1.5;//handle thickness
d = 7;//handle radius
e = 55;//handle polygon
f = 3;//handle hole radius
x = 7;//handle x
y = 8;//handle y
z = c/2;//handle z

module target(){
    union(){
        rotate([0,90,0])
            cylinder(h = 25, r = a, $fn = 40);//stick
        rotate([0,90,0])
            cylinder(h = 28.5, r = b, $fn = 12);//3mm joint
        
//R_handle
        translate([x,-y,-z]){
            cylinder(h = c, r = d, $fn = e+5);
            }
      
//L_handle
        translate([x,y,-z]){
            cylinder(h = c, r = d, $fn = e+5);
        }
    
    }
}

module tool(){
//R_hole
     translate([x,-y,-z]){
          cylinder(h = c, r = f, $fn = e);
            }

//L_hole
     translate([x,y,-z]){
          cylinder(h = c, r = f, $fn = e);
            }
        }
        
difference(){
    target();
    tool();
    }
