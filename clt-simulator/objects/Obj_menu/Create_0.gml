// — Leitura do INI com globais já definidas no obj_controller —
ini_open("config.ini");
global.config_volume = ini_read_real("config", "volume", global.config_volume);
global.config_fullscreen = ini_read_string("config", "fullscreen", string(global.config_fullscreen)) == "true";
ini_close();

// — Aplica configurações lidas —
window_set_fullscreen(global.config_fullscreen);
audio_group_set_gain(audiogroup_default, global.config_volume/100, 0);

// — Configuração do menu —
opcoes = ["Novo Jogo", "Carregar Jogo", "Opções", "Sair"];
index = 0;
op_max = array_length(opcoes);

// — Submenu de opções com texto dinâmico —
opcoes_config = [
  "Volume: " + string(global.config_volume) + "%",
  "Tela Cheia: " + (global.config_fullscreen ? "ON" : "OFF"),
  "Voltar"
];
config_index = 0;
estado_menu = "menu";

// — Animação fade e delay de navegação —
alpha_anim = 1;
alpha_dir = -0.02;
menu_delay = 0;
menu_delay_max = 10;

// — Slots de salvamento —
save_slots = ["Slot 1", "Slot 2", "Slot 3"];
for (var i = 0; i < 3; i++) {
    if (file_exists("save" + string(i+1) + ".ini")) {
        save_slots[i] = "Slot " + string(i+1) + " (Salvo)";
    }
}
carregar_index = 0;
