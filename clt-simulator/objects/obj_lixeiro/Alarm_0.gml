var _x_pos, _y_pos;
var _achou_posicao_valida = false;
var _tentativas = 0;
var _max_tentativas = 50;

while (!_achou_posicao_valida && _tentativas < _max_tentativas) {
    _x_pos = irandom_range(largura_segura_x, room_width - largura_segura_x - sprite_width);
    _y_pos = irandom_range(altura_segura_y, room_height - altura_segura_y - sprite_height);

    x = _x_pos;
    y = _y_pos;

    if (!place_meeting(x, y, obj_parede)) {
        _achou_posicao_valida = true;
    }
    _tentativas++;
}

if (!_achou_posicao_valida) {
    show_debug_message("obj_lixeiro: Nao encontrei posicao segura para spawnar. Reagendando.");
    visible = false;
    x = -1000; y = -1000;
    alarm[0] = room_speed * 1;
    exit;
}

visible = true;

direcao_x = choose(-1, 0, 1);
direcao_y = choose(-1, 0, 1);
if (direcao_x == 0 && direcao_y == 0) {
    direcao_x = choose(-1, 1);
}

var _lixo_aleatorio;
if (irandom(1) == 0) {
    _lixo_aleatorio = obj_LixoNormal;
} else {
    _lixo_aleatorio = obj_LixoBanana;
}
instance_create_layer(x, y, "Instances", _lixo_aleatorio);