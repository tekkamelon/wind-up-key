//ハンドルの基本部分
module handle_basic(handle_thickness, handle_radius, handle_polygon){
    for(y=[-8:16:8]){
		translate([7, y, -1.5/2]){ 
			cylinder(h=handle_thickness, r=handle_radius, $fn=handle_polygon);
		}
    }
}

//持ち手
module stick(stick_radius=1.7, joint_diameter=2.9){
    union(){
        rotate([0, 90, 0]){
            cylinder(h=25, r=stick_radius, $fn=40);
            cylinder(h=28.5, d=joint_diameter, $fn=12);
        }
    }
}

//ハンドル
module handle(handle_thickness=1.5, handle_radius=7){
	difference(){
		handle_basic(handle_thickness, handle_radius, 60);
		handle_basic(handle_thickness+1, handle_radius-4, 55);
	}
}

//各部の結合
union(){
   stick();
   handle();
}