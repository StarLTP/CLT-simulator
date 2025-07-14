// Array de sprites que compõem a sua cutscene.
// Certifique-se de que esses são os nomes EXATOS dos seus sprites no Asset Browser.
// (Assumimos que cada sprite tem 400x500 pixels, conforme você mencionou)
cutscene_sprites = [
    spr_cutscene_quadro1, // Substitua pelos nomes reais dos seus sprites
    spr_cutscene_quadro2,
    spr_cutscene_quadro3,
    spr_cutscene_quadro4,
    spr_cutscene_quadro5
];

// Índice do sprite atual que está sendo exibido.
current_sprite_index = 0;

// 'persistent = true;' não é necessário se a cutscene está em uma room própria
// e você muda de room no final, pois o objeto será destruído.
// persistent = true;