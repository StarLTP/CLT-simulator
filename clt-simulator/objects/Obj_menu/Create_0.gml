// --------------------- MENU PRINCIPAL ------------------------

opcoes = ["Novo Jogo", "Carregar Jogo", "Opções", "Sair"];
op_max = array_length(opcoes);
index = 0;


// --------------------- CONFIGURAÇÕES ------------------------

ini_open("config.ini");

global.config_volume = ini_read_real("config", "volume", 100);
global.config_fullscreen = ini_read_string("config", "fullscreen", "true") == "true";

ini_close();

window_set_fullscreen(global.config_fullscreen);

global.opcoes_config = [
    "Volume: " + string(global.config_volume) + "%",
    "Tela Cheia: " + (global.config_fullscreen ? "ON" : "OFF"),
    "Voltar"
];

global.config_index = 0;


// --------------------- CARREGAR JOGO ------------------------

save_slots = [];

for (var i = 0; i < 3; i++) {
    if (file_exists("save" + string(i + 1) + ".ini")) {
        save_slots[i] = "Slot " + string(i + 1) + " (Salvo)";
    } else {
        save_slots[i] = "Slot " + string(i + 1);
    }
}

carregar_index = 0;


// --------------------- ANIMAÇÃO E DELAY ------------------------

alpha_anim = 1;
alpha_dir = -0.02;

menu_delay = 0;
menu_delay_max = 10;

estado_menu = "menu"; // opções: "menu", "opcoes", "carregar"
