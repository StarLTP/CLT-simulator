if (!variable_global_exists("divida")) {
    global.divida = 17623;
}
if (!variable_global_exists("tempo_minigame")) {
    global.tempo_minigame = 120 * room_speed;
}
if (!variable_global_exists("tempo_minigame_max")) {
    global.tempo_minigame_max = global.tempo_minigame;
}
if (!variable_global_exists("meta_divida")) {
    global.meta_divida = 200;
}
if (!variable_global_exists("pause")) {
    global.pause = false;
}
if (!variable_global_exists("lixeiros_ativos")) {
    global.lixeiros_ativos = 1;
}

persistent = true;