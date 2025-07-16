// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Miau"],
    ["PLAYER", "Bom dia, Café!"],
    ["NPC", "Nyan"],
    ["PLAYER", "É Café vou ter que encontrar um emprego"],
    ["NPC", "Miau Miau"],
    ["PLAYER", "O banco ta cobrando a divida vou tentar"],
    ["PLAYER", "Conversar com o dono do banco"],
	["PLAYER", "O senhor tostão deve ser um pouco compreensivo."],
	["NPC", "Miau?"],
	
];


conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_cat; 

 // Geralmente NPCs começam parados