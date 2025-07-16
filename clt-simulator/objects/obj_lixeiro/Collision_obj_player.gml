global.divida += 50;
show_debug_message("Lixeiro tocou no player! Dívida aumentada em 50. Dívida atual: " + string(global.divida));

visible = false;
x = -1000;
y = -1000;
alarm[0] = room_speed * irandom_range(1, 3);