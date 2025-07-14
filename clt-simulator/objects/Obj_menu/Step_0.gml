// Fade animado
alpha_anim += alpha_dir;
if (alpha_anim <= 0.4 || alpha_anim >= 1) {
    alpha_dir *= -1;
}

// Delay
if (menu_delay > 0) {
    menu_delay -= 1;
}

// Navegação com delay (W/S)
var move_down = keyboard_check(ord("S"));
var move_up = keyboard_check(ord("W"));

if (menu_delay <= 0) {
    if (move_down) {
        var snd = audio_play_sound(snd_menu_move, 1, false);
        audio_sound_gain(snd, config_volume / 100, 0);
        
        if (estado_menu == "menu") index++;
        else if (estado_menu == "opcoes") config_index++;
        else if (estado_menu == "carregar") carregar_index++;
        
        menu_delay = menu_delay_max;
    }
    else if (move_up) {
        var snd = audio_play_sound(snd_menu_move, 1, false);
        audio_sound_gain(snd, config_volume / 100, 0);
        
        if (estado_menu == "menu") index--;
        else if (estado_menu == "opcoes") config_index--;
        else if (estado_menu == "carregar") carregar_index--;
        
        menu_delay = menu_delay_max;
    }
}

// Loop de índice
if (estado_menu == "menu") {
    if (index < 0) index = op_max - 1;
    if (index >= op_max) index = 0;
}
else if (estado_menu == "opcoes") {
    if (config_index < 0) config_index = array_length(opcoes_config) - 1;
    if (config_index >= array_length(opcoes_config)) config_index = 0;
}
else if (estado_menu == "carregar") {
    if (carregar_index < 0) carregar_index = 3;
    if (carregar_index > 3) carregar_index = 0;
}
