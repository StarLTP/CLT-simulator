

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Olá, bem-vinda ao Banco de Circolônia"],
	["NPC", " como posso ajudá-la?"],
    ["PLAYER", "Então..."],
	["PLAYER", "Eu to com uma divida quanto ela ta atualmente?"],
    ["NPC", "Senhora Claudinha martins correto?"],
];


conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_bank; 

image_speed = 1; // Geralmente NPCs começam parados