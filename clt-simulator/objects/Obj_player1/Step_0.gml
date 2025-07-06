
var x_input = 0;
var y_input = 0;

// Obter Entradas do Teclado

// Avalia a entrada horizontal (A e D)
// Se 'A' é pressionado, subtrai 1. Se 'D' é pressionado, soma 1.
// Se ambos são pressionados, o resultado é 0 (-1 + 1 = 0), mantendo o personagem parado.
if (keyboard_check(ord("A"))) {
    x_input -= 1;
}
if (keyboard_check(ord("D"))) {
    x_input += 1;
}

// Avalia a entrada vertical (W e S)
// Se 'W' é pressionado, subtrai 1. Se 'S' é pressionado, soma 1.
// Se ambos são pressionados, o resultado é 0 (-1 + 1 = 0), mantendo o personagem parado.
if (keyboard_check(ord("W"))) {
    y_input -= 1;
}
if (keyboard_check(ord("S"))) {
    y_input += 1;
}


// Lógica de Animação e Direção do Sprite 

// Define o sprite padrão para quando o personagem está parado ou para garantir um estado inicial
current_sprite = spr_p_down; 



// Se houver qualquer input horizontal, o sprite lateral será exibido.
if (x_input < 0) { 
    current_sprite = spr_p_left; // Define o sprite para a esquerda

} else if (x_input > 0) { // Se a intenção é mover para a direita (tecla 'D' ativa e não anulada por 'A')
    current_sprite = spr_p_right_ani; // Define o sprite para a direita
  
}
// Se NÃO houver input horizontal (x_input é 0, seja por ausência de teclas ou teclas opostas)
else {
    
    if (y_input < 0) { 
        current_sprite = spr_p_up; 
      
    } else if (y_input > 0) { 
        current_sprite = Spr_p_down_ani;
     
    }
   
}


sprite_index = current_sprite;
image_speed = 1; 


//Lógica de Movimento e Colisão

// MOVIMENTO HORIZONTAL (X)

var target_x = x + (x_input * velocidade);

// Verifica se há uma parede na posição X futura.

if (place_meeting(target_x, y, obj_parede)) {
   
    while (!place_meeting(x + sign(x_input), y, obj_parede)) {
        x += sign(x_input); 
    }
    x_input = 0;
}

x += (x_input * velocidade);


// MOVIMENTO VERTICAL (Y)

var target_y = y + (y_input * velocidade);

// Verifica se há uma parede na posição Y futura.
if (place_meeting(x, target_y, obj_parede)) {
   
    while (!place_meeting(x, y + sign(y_input), obj_parede)) {
        y += sign(y_input); 
    }
    y_input = 0; 
}

y += (y_input * velocidade);