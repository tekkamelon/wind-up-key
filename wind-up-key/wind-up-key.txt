//cylinderの基本部分
module cylinder_basic(translate_x, translate_y, translate_z, rotate_x, rotate_y, rotate_z, handle_thickness, handle_radius, handle_polygon){
	translate([translate_x, translate_y, translate_z]){ 
        rotate([rotate_x, rotate_y, rotate_z]){
            cylinder(h=handle_thickness, r=handle_radius, $fn=handle_polygon);
	    }
    }
}

//持ち手
module stick(stick_radius=1.7, joint_diameter=2.9){
    union(){
        cylinder_basic(0, 0, 0, 0, 90, 0, 25, stick_radius, 40);
        cylinder_basic(0, 0, 0, 0, 90, 0, 28.5, joint_diameter/2, 12);
    }
}

//ハンドル
module handle(handle_thickness=1.5, handle_radius=7){
    for(y=[-8:16:8]){
	    difference(){
	    	cylinder_basic(7, y, -1.5/2, 0, 0, 0, handle_thickness, handle_radius, 60);
	    	cylinder_basic(7, y, -1.5/2, 0, 0, 0, handle_thickness+1, handle_radius-4, 55);
	    }
    }
}

//各部の結合
union(){
   stick();
   handle();
}