
var x_input = 0; // Armazena a entrada horizontal do teclado
var y_input = 0; // Armazena a entrada vertical do teclado


// Calcula a entrada horizontal
if (keyboard_check(ord("A"))) x_input -= 1;
if (keyboard_check(ord("D"))) x_input += 1;

// Calcula a entrada vertical
if (keyboard_check(ord("W"))) y_input -= 1;
if (keyboard_check(ord("S"))) y_input += 1;



// Calcula a próxima posição X baseada na entrada e velocidade
var _new_x_pos = x + (x_input * velocidade);

// Verifica se haverá colisão na próxima posição X
if (place_meeting(_new_x_pos, y, obj_parede)) {
 
    while (!place_meeting(x + sign(x_input), y, obj_parede)) {
        x += sign(x_input);
    }
    // Zera a entrada para parar o movimento na colisão
    x_input = 0;
}
// Aplica o movimento horizontal final
x += (x_input * velocidade);


// Movimento e Colisão Vertical 
// Calcula a próxima posição Y baseada na entrada e velocidade
var _new_y_pos = y + (y_input * velocidade);

// Verifica se haverá colisão na próxima posição Y
if (place_meeting(x, _new_y_pos, obj_parede)) {

    while (!place_meeting(x, y + sign(y_input), obj_parede)) {
        y += sign(y_input);
    }
    // Zera a entrada para parar o movimento na colisão
    y_input = 0;
}
// Aplica o movimento vertical final
y += (y_input * velocidade);