// Velocidade de movimento do personagem
velocidade = 1;

// Variáveis para controlar a direção e o sprite
// Define a direção inicial do sprite quando o jogo começa.
// Você pode mudar para "up", "left", "right" ou "down" conforme preferir.
last_direction = "down"; // Adicionamos esta variável para rastrear a última direção.

// Define o sprite inicial do personagem (deve ser um sprite parado, se você tiver um)
// Use Spr_p_down_ani se for o sprite que você quer para o estado inicial para baixo.
sprite_index = Spr_p_down_ani;
image_speed = 0; // Começa parado, sem animação (a menos que já queira animação inicial)

image_xscale = 1;
image_yscale = 1;