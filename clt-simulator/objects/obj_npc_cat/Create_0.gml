

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Miau"],
    ["PLAYER", "Bom dia, Café!"],
    ["NPC", "Nyan"],
    ["PLAYER", "É Café vou ter que ir trabalhar hoje!"],
    ["NPC", "Maiu Maiu"],
    ["PLAYER", "Até a noite Café"],
];


conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_cat; 

image_speed = 1; // Geralmente NPCs começam parados