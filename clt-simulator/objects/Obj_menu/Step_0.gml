// — Controla animação fade —
alpha_anim += alpha_dir;
if (alpha_anim <= 0.4 || alpha_anim >= 1) alpha_dir *= -1;

// — Delay para navegação —
if (menu_delay > 0) menu_delay--;

// — Navegação com W/S —
if (menu_delay == 0) {
    if (keyboard_check_pressed(ord("S"))) {
        audio_play_sound(snd_menu_move, 1, false);
        if (estado_menu == "menu") index = (index+1) mod op_max;
        else if (estado_menu == "opcoes") config_index = (config_index+1) mod array_length(opcoes_config);
        else if (estado_menu == "carregar") carregar_index = (carregar_index+1) mod 4;
        menu_delay = menu_delay_max;
    }
    if (keyboard_check_pressed(ord("W"))) {
        audio_play_sound(snd_menu_move, 1, false);
        if (estado_menu == "menu") index = (index-1+op_max) mod op_max;
        else if (estado_menu == "opcoes") config_index = (config_index-1+array_length(opcoes_config)) mod array_length(opcoes_config);
        else if (estado_menu == "carregar") carregar_index = (carregar_index-1+4) mod 4;
        menu_delay = menu_delay_max;
    }
}

// — Suporte a joystick —
if (gamepad_is_connected(0)) {
    if (gamepad_button_check_pressed(0, gp_padd)) keyboard_key_press(ord("S"));
    if (gamepad_button_check_pressed(0, gp_padu)) keyboard_key_press(ord("W"));
    if (gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_start)) keyboard_key_press(vk_enter);
}

// — Confirmação com Enter/Espaço —
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    audio_play_sound(snd_menu_select, 1, false);

    if (estado_menu == "menu") {
        switch (index) {
            case 0: room_goto_next(); break;
            case 1: estado_menu = "carregar"; carregar_index = 0; break;
            case 2: estado_menu = "opcoes"; config_index = 0; break;
            case 3: game_end(); break;
        }
    }
    else if (estado_menu == "opcoes") {
        switch (config_index) {
            case 0:
                global.config_volume -= 10;
                if (global.config_volume < 0) global.config_volume = 100;
                audio_group_set_gain(audiogroup_default, global.config_volume/100, 0);
                opcoes_config[0] = "Volume: " + string(global.config_volume) + "%";
                break;
            case 1:
                global.config_fullscreen = !global.config_fullscreen;
                window_set_fullscreen(global.config_fullscreen);
                opcoes_config[1] = "Tela Cheia: " + (global.config_fullscreen ? "ON" : "OFF");
                break;
            case 2:
                estado_menu = "menu";
                break;
        }
        ini_open("config.ini");
        ini_write_real("config", "volume", global.config_volume);
        ini_write_string("config", "fullscreen", string(global.config_fullscreen));
        ini_close();
    }
    else if (estado_menu == "carregar") {
        if (carregar_index < 3) {
            if (file_exists("save"+string(carregar_index+1)+".ini")) {
                ini_open("save"+string(carregar_index+1)+".ini");
                var fase = ini_read_real("jogo", "fase", 1);
                ini_close();
                show_message("Carregado: Fase " + string(fase));
                room_goto_next();
            } else {
                show_message("Slot vazio.");
            }
        } else {
            estado_menu = "menu";
        }
    }
}
