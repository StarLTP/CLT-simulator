// Evento Create de obj_npc_cat (Exemplo para um NPC gato)

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao obj_player.
conversation = [
    ["NPC", "Miau"],
    ["PLAYER", "Bom dia, Café!"],
    ["NPC", "Nyan"],
    ["PLAYER", "É Café vou ter que ir trabalhar hoje!"],
    ["NPC", "Maiu Maiu"],
    ["PLAYER", "Até a noite Café"],
];

// O índice da linha atual na conversa (sempre começa em 0)
conversation_index = 0;

// Flag para saber se a conversa está ativa (herdado do parent, mas definido aqui para clareza inicial)
// Será manipulado pelo obj_npc_parent.
dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
// <<--- CRIE ESTE SPRITE! Use o nome EXATO do seu sprite de rosto do gato.
my_face_sprite = spr_cat_npc; 

// Nota: Você também deve atribuir o sprite visual do corpo do NPC aqui se ele for único.
// sprite_index = spr_npc_cat; 
// image_speed = 0; // Geralmente NPCs começam parados