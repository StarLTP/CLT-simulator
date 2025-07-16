if (global.pause) exit;

var _tempo_passado_em_segundos = (global.tempo_minigame_max - global.tempo_minigame) / room_speed;
var _lixeiros_baseado_no_tempo = 1 + floor(_tempo_passado_em_segundos / 20);
global.lixeiros_ativos = min(max_lixeiros_simultaneos, _lixeiros_baseado_no_tempo);