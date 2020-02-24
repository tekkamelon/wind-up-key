stick_radius = 1.7;
joint_diameter = 2.9;
handle_thickness = 1.5;
handle_radius = 7;
handle_polygon = 55;
handle_hole_radius = 3;
handle_x = 7;
handle_z = -handle_thickness/2;

module stick(){
    union(){
        rotate([0,90,0]){
            cylinder(h = 25, r = stick_radius, $fn = 40);
            cylinder(h = 28.5, d = joint_diameter, $fn = 12);
        }
    }
}

module handle(){
    for(y = [-8:16:8]){
        difference(){
            translate([handle_x, y, handle_z]){
                cylinder(h = handle_thickness, r = handle_radius, $fn = handle_polygon+5);
            }
            translate([handle_x, y, handle_z-0.75]){
                cylinder(h = handle_thickness+1.5, r = handle_hole_radius, $fn = handle_polygon);
            }
        }
    }
}

union(){
   stick();
   handle();
}
