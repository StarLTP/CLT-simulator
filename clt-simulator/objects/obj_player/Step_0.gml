var x_input = 0;
var y_input = 0;

// Obter Entradas do Teclado
if (keyboard_check(ord("A"))) {
    x_input -= 1;
}
if (keyboard_check(ord("D"))) {
    x_input += 1;
}
if (keyboard_check(ord("W"))) {
    y_input -= 1;
}
if (keyboard_check(ord("S"))) {
    y_input += 1;
}

// Lógica de Animação e Direção do Sprite

// Se houver qualquer input de movimento
if (x_input != 0 || y_input != 0)
{
    image_speed = 1;

    // Prioriza o movimento horizontal se houver
    if (x_input < 0) {
        sprite_index = spr_p_left_ani;
        last_direction = "left";
    } else if (x_input > 0) {
        sprite_index = spr_p_right_ani;
        last_direction = "right";
    }
    // Se não houver input horizontal, verifica o vertical
    else if (y_input < 0) {
        sprite_index = spr_p_up_ani;
        last_direction = "up";
    } else if (y_input > 0) {
        sprite_index = Spr_p_down_ani;
        last_direction = "down";
    }
}
else // Se não houver input de movimento (personagem parado)
{
    image_speed = 0;
    image_index = 0;

    // Usa a última direção conhecida para definir o sprite parado correspondente
    switch (last_direction) {
        case "left":
            sprite_index = spr_p_left_idle;
            break;
        case "right":
            sprite_index = spr_p_right_idle;
            break;
        case "up":
            sprite_index = spr_p_up_idle;
            break;
        case "down":
            sprite_index = Spr_p_down_ani;
            break;
        default:
            sprite_index = Spr_p_down_ani;
            break;
    }
}


// MOVIMENTO HORIZONTAL (X)
var move_h = x_input * velocidade; // Movimento horizontal desejado
if (place_meeting(x + move_h, y, obj_parede)) {
    while (!place_meeting(x + sign(move_h), y, obj_parede)) {
        x += sign(move_h);
    }
} else {
    x += move_h; // Apenas move se não houver colisão
}

// MOVIMENTO VERTICAL (Y)
var move_v = y_input * velocidade; // Movimento vertical desejado
if (place_meeting(x, y + move_v, obj_parede)) {
    while (!place_meeting(x, y + sign(move_v), obj_parede)) {
        y += sign(move_v);
    }
} else {
    y += move_v; // Apenas move se não houver colisão
}