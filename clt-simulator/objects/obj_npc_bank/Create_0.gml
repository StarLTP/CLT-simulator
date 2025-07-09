

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Olá, bem-vinda ao Banco de Circolônia"],
	["NPC", " como posso ajudá-la?"],
    ["PLAYER", "Quero ver minha dívida"],
    ["NPC", "Sua divida é de 99.999 circoins"]
];


conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_bank_npc; 

image_speed = 1; // Geralmente NPCs começam parados