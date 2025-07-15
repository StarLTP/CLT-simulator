
// --------------------- Animação de brilho no texto ------------------------
alpha_anim += alpha_dir;
if (alpha_anim <= 0.4 || alpha_anim >= 1) {
    alpha_dir *= -1;
}

// --------------------- Delay de movimentação ------------------------
if (menu_delay > 0) {
    menu_delay -= 1;
}

// --------------------- Navegação com W/S ------------------------
var move_down = keyboard_check(ord("S"));
var move_up = keyboard_check(ord("W"));

if (menu_delay <= 0) {
    if (move_down) {
        var snd = audio_play_sound(snd_menu_move, 1, false);
        audio_sound_gain(snd, global.config_volume / 100, 0);

        switch (estado_menu) {
            case "menu": index++; break;
            case "opcoes": global.config_index++; break;
            case "carregar": carregar_index++; break;
        }

        menu_delay = menu_delay_max;
    }
    else if (move_up) {
        var snd = audio_play_sound(snd_menu_move, 1, false);
        audio_sound_gain(snd, global.config_volume / 100, 0);

        switch (estado_menu) {
            case "menu": index--; break;
            case "opcoes": global.config_index--; break;
            case "carregar": carregar_index--; break;
        }

        menu_delay = menu_delay_max;
    }
}

// --------------------- Loop de índice ------------------------
switch (estado_menu) {
    case "menu":
        if (index < 0) index = op_max - 1;
        if (index >= op_max) index = 0;
        break;

    case "opcoes":
        if (is_array(global.opcoes_config)) {
            var max_len = array_length(global.opcoes_config);
            if (global.config_index < 0) global.config_index = max_len - 1;
            if (global.config_index >= max_len) global.config_index = 0;
        } else {
            global.config_index = 0; // fallback caso não tenha definido o array ainda
        }
        break;

    case "carregar":
        if (carregar_index < 0) carregar_index = 3;
        if (carregar_index > 3) carregar_index = 0;
        break;
}
