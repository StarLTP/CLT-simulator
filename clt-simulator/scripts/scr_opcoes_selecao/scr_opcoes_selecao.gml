function scr_opcoes_selecao(){
switch (global.config_index) {
    case 0:
        global.config_volume -= 10;
        if (global.config_volume < 0) global.config_volume = 100;
        global.opcoes_config[0] = "Volume: " + string(global.config_volume) + "%";
        break;

    case 1:
        global.config_fullscreen = !global.config_fullscreen;
        window_set_fullscreen(global.config_fullscreen);
        global.opcoes_config[1] = "Tela Cheia: " + (global.config_fullscreen ? "ON" : "OFF");
        break;

    case 2:
        return true; // Voltar
}

ini_open("config.ini");
ini_write_real("config", "volume", global.config_volume);
ini_write_string("config", "fullscreen", string(global.config_fullscreen));
ini_close();

return false;

}