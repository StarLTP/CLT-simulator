

// Define a conversa específica para ESTE NPC
// Cada elemento é uma sub-array: [tipo_do_falante, "texto_da_fala"]
// "NPC" refere-se a ESTE NPC, "PLAYER" refere-se ao player.
conversation = [
    ["NPC", "Olá, bem-vinda ao Banco de Circolônia"],
	["NPC", " como posso ajudá-la?"],
    ["PLAYER", "então..."],
	["PLAYER", "eu to com uma divida quanto ela ta atualmente?"],
    ["NPC", "Senhora Claudinha Martins correto?"],
	["PLAYER", "sim sim..."],
	["PLAYER", "*Pensando* Espero que não tenha ficado muito caro"],
	["PLAYER", "Eu tinha esquecido completamente que"],
	["PLAYER", " a divida existia."],
    ["NPC", "C$ 17.623,42"],
	["PLAYER", "QUE?, mas eu tinha pagado a divida do estrago no credito."],
	["NPC", "Exatamente, por isso, mas a senhora não pagou a divida com a gente"],
	["NPC", "Nosso banco de Circolônia tem uma taxa de juros de 12% ao mês e"],
	["NPC", " a senhora não paga a divida a 4 anos, 3 meses e 23 dias, além"],
	["PLAYER", "Além?..."],
	["NPC", "Que o prazo final para pagar é daqui a 5 dias, e se não pagar"],
	["NPC", "terei que chamar a policia"],
	["PLAYER", "Não tem algo que eu possa fazer não?"],
	["PLAYER", "Eu não tenho esse dinheiro, me ajuda porfavor!!!  "],
	["NPC", "hum..."],
	["NPC", "Um amigo meu precisa de ajuda com algo"],
	["PLAYER", "EU ACEITO!!!"],
	["NPC", "ele é chefe de um armazém e alguém"],
	["NPC", "e parece que alguem destruiu o armazém"],
	["PLAYER", ". . ."],
	["NPC", "destruiu o armazém caindo nas coisas, ficando tudo sujo."],
	["PLAYER", "rapazzzz, maldade né..."],
	["NPC", "ai ele precisa de pessoas para arrumar lá, vá até lá"],
	["PLAYER", "Sim senhor tostão, vou até lá!!!"],
];



conversation_index = 0;

dialogue_active = false; 

// Sprite do rosto específico DESTE NPC.
my_face_sprite = spr_npc_aluno0; 

image_speed = 1; // Geralmente NPCs começam parados