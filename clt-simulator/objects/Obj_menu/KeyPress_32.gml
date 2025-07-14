var snd = audio_play_sound(snd_menu_select, 1, false);
audio_sound_gain(snd, config_volume / 100, 0);

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
            config_volume -= 10;
            if (config_volume < 0) config_volume = 100;
            opcoes_config[0] = "Volume: " + string(config_volume) + "%";
            break;
        case 1:
            config_fullscreen = !config_fullscreen;
            window_set_fullscreen(config_fullscreen);
            opcoes_config[1] = "Tela Cheia: " + (config_fullscreen ? "ON" : "OFF");
            break;
        case 2:
            estado_menu = "menu";
            break;
    }

    ini_open("config.ini");
    ini_write_real("config", "volume", config_volume);
    ini_write_string("config", "fullscreen", string(config_fullscreen));
    ini_close();
}
else if (estado_menu == "carregar") {
    if (carregar_index < 3) {
        if (file_exists("save" + string(carregar_index + 1) + ".ini")) {
            ini_open("save" + string(carregar_index + 1) + ".ini");
            var fase = ini_read_real("jogo", "fase", 1);
            ini_close();
            show_message("Carregado: Fase " + string(fase));
            room_goto_next(); // Substitua pela sala correta
        } else {
            show_message("Slot vazio.");
        }
    } else {
        estado_menu = "menu";
    }
}
