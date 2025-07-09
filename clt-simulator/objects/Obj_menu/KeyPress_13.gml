// Reproduz som de seleção
audio_play_sound(snd_menu_select, 1, false);

if (estado_menu == "opcoes") {
    switch (config_index) {
        case 0:
            // Ajusta volume global
            global.config_volume -= 10;
            if (global.config_volume < 0) {
                global.config_volume = 100;
            }
            opcoes_config[0] = "Volume: " + string(global.config_volume) + "%";
            audio_group_set_gain(audiogroup_default, global.config_volume / 100, 0);
            break;

        case 1:
            // Alterna fullscreen global
            global.config_fullscreen = !global.config_fullscreen;
            window_set_fullscreen(global.config_fullscreen);
            opcoes_config[1] = "Tela Cheia: " + (global.config_fullscreen ? "ON" : "OFF");
            break;

        case 2:
            // Volta ao menu principal
            estado_menu = "menu";
            break;
    }

    // Salva as configurações atualizadas
    ini_open("config.ini");
    ini_write_real("config", "volume", global.config_volume);
    ini_write_string("config", "fullscreen", string(global.config_fullscreen));
    ini_close();
}
