

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Olá, bem-vinda ao Banco de Circolônia"],
	["NPC", " como posso ajudá-la?"],
    ["PLAYER", "Então..."],
	["PLAYER", "Eu to com uma divida quanto ela ta atualmente?"],
    ["NPC", "Senhora Claudinha martins correto?"],
	["PLAYER", "Sim sim..."],
	["PLAYER", "*Pensando* Espero que não tenha ficado muito caro"],
	["PLAYER", "*Pensando* Eu tinha esquecido completamente"],
	["PLAYER", "*Pensando* que a divida existia."],
    ["NPC", "C$ 17.623,42"],
	["PLAYER", "QUE?, mas eu tinha pagado a divida do estrago no credito."],
	["NPC", "Exatamente, por isso, mas a senhora não pagou a divida com a gente"],
	["NPC", "Nosso banco de Circolônia tem uma taxa de juros de 12% ao mês e"],
	["NPC", "e a senhora não paga a divida a 4 anos, 3 meses e 23 dias, além"],
	["PLAYER", "Além?..."]
];


conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_bank; 

image_speed = 1; // Geralmente NPCs começam parados