opcoes = ["Novo Jogo", "Carregar Jogo", "Opções", "Sair"];
op_max = array_length(opcoes);
index = 0;

opcoes_config = ["Volume: 100%", "Tela Cheia: ON", "Voltar"];
config_index = 0;

estado_menu = "menu"; // "menu", "opcoes", "carregar"

alpha_anim = 1;
alpha_dir = -0.02;

menu_delay = 0;
menu_delay_max = 10;

ini_open("config.ini");
config_volume = ini_read_real("config", "volume", 100);
config_fullscreen = ini_read_string("config", "fullscreen", "true") == "true";
ini_close();

window_set_fullscreen(config_fullscreen);

opcoes_config[0] = "Volume: " + string(config_volume) + "%";
opcoes_config[1] = "Tela Cheia: " + (config_fullscreen ? "ON" : "OFF");

save_slots = ["Slot 1", "Slot 2", "Slot 3"];
for (var i = 0; i < 3; i++) {
    if (file_exists("save" + string(i + 1) + ".ini")) {
        save_slots[i] = "Slot " + string(i + 1) + " (Salvo)";
    }
}
carregar_index = 0;
