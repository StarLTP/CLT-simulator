if(global.pause){
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

x+=hsp
y+=vsp

if x<0 {hsp=-hsp}
if x>room_width {hsp=-hsp}

if y<0 {vsp=-vsp}
if y>room_height {vsp=-vsp}