
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

// --- Lógica de Animação e Direção do Sprite ---

// Se houver qualquer input de movimento
if (x_input != 0 || y_input != 0)
{
    image_speed = 1; // Ativa a animação de caminhada

    // Prioriza o movimento horizontal se houver
    if (x_input < 0) {
        sprite_index = spr_p_left_ani; // Use o sprite animado de caminhada para a esquerda
        last_direction = "left";
    } else if (x_input > 0) {
        sprite_index = spr_p_right_ani; // Use o sprite animado de caminhada para a direita
        last_direction = "right";
    }
    // Se não houver input horizontal, verifica o vertical
    else if (y_input < 0) {
        sprite_index = spr_p_up_ani; // Assumindo que você tem um sprite animado para cima
        last_direction = "up";
    } else if (y_input > 0) {
        sprite_index = Spr_p_down_ani; // Use o sprite animado de caminhada para baixo
        last_direction = "down";
    }
}
else // Se não houver input de movimento (personagem parado)
{
    image_speed = 0; // Para a animação
    image_index = 0; // Garante que o sprite parado comece do primeiro frame, se for animado ou não

    // Usa a última direção conhecida para definir o sprite parado correspondente
    switch (last_direction) {
        case "left":
            sprite_index = spr_p_left_idle; // Sprite parado para a esquerda
            break;
        case "right":
            sprite_index = spr_p_right_idle; // Sprite parado para a direita
            break;
        case "up":
            sprite_index = spr_p_up_idle; // Sprite parado para cima
            break;
        case "down":
            sprite_index = Spr_p_down_ani; // Use spr_p_down para o sprite parado para baixo se não houver um _idle
            break;
        default:
            // Fallback caso last_direction não esteja definida
            sprite_index = Spr_p_down_ani; // Sprite parado padrão
            break;
    }
}


// MOVIMENTO HORIZONTAL (X)
var target_x = x + (x_input * velocidade);
if (place_meeting(target_x, y, obj_parede)) {
    while (!place_meeting(x + sign(x_input), y, obj_parede)) {
        x += sign(x_input);
    }
}
x += (x_input * velocidade);

// MOVIMENTO VERTICAL (Y)
var target_y = y + (y_input * velocidade);
if (place_meeting(x, target_y, obj_parede)) {
    while (!place_meeting(x, y + sign(y_input), obj_parede)) {
        y += sign(y_input);
    }
}
y += (y_input * velocidade);