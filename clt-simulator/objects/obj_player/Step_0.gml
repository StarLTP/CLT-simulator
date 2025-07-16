//Deve ser colocado em todo objeto que parar durante o pause
if(global.pause){
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

var dialog_box_exists = instance_exists(obj_textbox);

if (!dialog_box_exists)
{
    var x_input = 0;
    var y_input = 0;

    if (keyboard_check(ord("A"))) { x_input -= 1; }
    if (keyboard_check(ord("D"))) { x_input += 1; }
    if (keyboard_check(ord("W"))) { y_input -= 1; }
    if (keyboard_check(ord("S"))) { y_input += 1; }

    if (x_input != 0 || y_input != 0)
    {
        image_speed = 1;
        if (x_input < 0) { sprite_index = spr_p_left_ani; last_direction = "left"; }
        else if (x_input > 0) { sprite_index = spr_p_right_ani; last_direction = "right"; }
        else if (y_input < 0) { sprite_index = spr_p_up_ani; last_direction = "up"; }
        else if (y_input > 0) { sprite_index = Spr_p_down_ani; last_direction = "down"; }
    }
    else
    {
        image_speed = 0;
        image_index = 0;
        switch (last_direction) {
            case "left": sprite_index = spr_p_left_idle; break;
            case "right": sprite_index = spr_p_right_idle; break;
            case "up": sprite_index = spr_p_up_idle; break;
            case "down": sprite_index = Spr_p_down_ani; break;
            default: sprite_index = Spr_p_down_ani; break;
        }
    }

    var move_h = x_input * velocidade;
    if (place_meeting(x + move_h, y, obj_parede) || place_meeting(x + move_h, y, obj_npc_parent)) {
        while (!place_meeting(x + sign(move_h), y, obj_parede) && !place_meeting(x + sign(move_h), y, obj_npc_parent)) {
            x += sign(move_h);
        }
    } else {
        x += move_h;
    }

    var move_v = y_input * velocidade;
    if (place_meeting(x, y + move_v, obj_parede) || place_meeting(x, y + move_v, obj_npc_parent)) {
        while (!place_meeting(x, y + sign(move_v), obj_parede) && !place_meeting(x, y + sign(move_v), obj_npc_parent)) {
            y += sign(move_v);
        }
    } else {
        y += move_v;
    }
}
else
{
    image_speed = 0;
    image_index = 0;
}

//proxima sala
if (place_meeting(x,y, obj_prox)){
	room_goto_next();}
	
	//proxima sala
if (place_meeting(x,y, obj_back)){
	room_goto_previous();}