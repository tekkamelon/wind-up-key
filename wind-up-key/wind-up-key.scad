a = 4;//radius
b = 3;//joint radius
c = 3;//handle thickness
d = 15;//handle radius
$fn= 65;

module target(){
    union(){
        rotate([0,90,0])
            cylinder(h = 40, r1 = a, r2 = a);//stick
        rotate([0,90,0])
            cylinder(h = 50, r1 = b, r2 = b);//3mm joint
        
//R_handle
        translate([12,-16.5,-1.5]){
            cylinder(h = c, r1 = d, r2 = d);
            }
      
//L_handle
        translate([12,16.5,-1.5]){
            cylinder(h = c, r1 = d, r2 = d);
        }
    
    }
}

module tool(){
//R_hole
     translate([12,-16.5,-1.5]){
          cylinder(h = c, r1 = 6, r2 = 6);
            }

//L_hole
     translate([12,16.5,-1.5]){
          cylinder(h = c, r1 = 6, r2 = 6);
            }
        }
        
difference(){
    target();
    tool();
    }



