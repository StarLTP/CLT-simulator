function scr_opcoes_navegacao(){
if (keyboard_check_pressed(ord("S"))) {
    global.config_index = (global.config_index + 1) mod array_length(global.opcoes_config);
}
if (keyboard_check_pressed(ord("W"))) {
    global.config_index = (global.config_index - 1 + array_length(global.opcoes_config)) mod array_length(global.opcoes_config);
}

}