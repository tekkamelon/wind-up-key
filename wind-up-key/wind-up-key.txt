stick_radius=1.7;
joint_diameter=2.9;
handle_radius=7;
handle_hole_radius=3;
handle_x=7;

module stick(){
    union(){
        rotate([0,90,0]){
            cylinder(h=25, r=stick_radius, $fn=40);
            cylinder(h=28.5, d=joint_diameter, $fn=12);
        }
    }
}

module handle_basic(handle_thickness, handle_radius, handle_polygon){
    for(y=[-8:16:8]){
		translate([7, y, -1.5/2]){ 
			cylinder(h=handle_thickness, r=handle_radius, $fn=handle_polygon);
		}
    }
}

module handle(){
	difference(){
		handle_basic(1.5, 7, 60);
		handle_basic(1.5, 3, 55 );
	}
}

union(){
   stick();
   handle();
}
