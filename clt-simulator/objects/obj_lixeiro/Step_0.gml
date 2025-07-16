if (global.pause) {
    image_speed = 0;
    exit;
} else {
    image_speed = 1;
}

if (visible) {
    var _colidiu_h = place_meeting(x + (direcao_x * velocidade), y, obj_parede);
    var _colidiu_v = place_meeting(x, y + (direcao_y * velocidade), obj_parede);

    if (_colidiu_h || bbox_left <= largura_segura_x || bbox_right >= room_width - largura_segura_x) {
        direcao_x *= -1;
        if (_colidiu_h) {
            if (place_meeting(x, y + sign(direcao_y), obj_parede) || direcao_y == 0) {
                direcao_y = choose(-1, 1);
            }
        }
    }
    if (_colidiu_v || bbox_top <= altura_segura_y || bbox_bottom >= room_height - altura_segura_y) {
        direcao_y *= -1;
        if (_colidiu_v) {
            if (place_meeting(x + sign(direcao_x), y, obj_parede) || direcao_x == 0) {
                direcao_x = choose(-1, 1);
            }
        }
    }

    if (direcao_x == 0 && direcao_y == 0) {
        direcao_x = choose(-1, 1);
        direcao_y = choose(-1, 1);
    }

    x += direcao_x * velocidade;
    y += direcao_y * velocidade;

    if (irandom(100) < 1) {
        var _lixo_aleatorio;
        if (irandom(1) == 0) {
            _lixo_aleatorio = obj_LixoNormal;
        } else {
            _lixo_aleatorio = obj_LixoBanana;
        }
        instance_create_layer(x, y, "Instances", _lixo_aleatorio);
    }
}