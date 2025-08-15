function scr_opcoes_draw(x, y, dist){

for (var i = 0; i < array_length(global.opcoes_config); i++) {
    draw_set_color(global.config_index == i ? make_color_rgb(167, 240, 112) : c_white);
    draw_text(x, y + (dist * i), global.opcoes_config[i]);
}

}