draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(10, 10, "Divida: " + string(global.divida));
draw_text(10, 40, "Tempo: " + string(ceil(global.tempo_minigame / room_speed)));