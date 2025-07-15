function scr_opcoes_draw(x, y, dist){

for (var i = 0; i < array_length(global.opcoes_config); i++) {
    draw_set_color(global.config_index == i ? c_orange : c_white);
    draw_text(x, y + (dist * i), global.opcoes_config[i]);
}

}