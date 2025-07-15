function scr_salvar_slot(index){

// ---------------------  Salvar o jogo no slot especificado (0 = Slot 1, 1 = Slot 2, ...)

var slot = index + 1;
var nome_arquivo = "save" + string(slot) + ".ini";

// Exemplo de dados salvos. Substitua por suas variáveis reais.
ini_open(nome_arquivo);
ini_write_real("jogo", "fase", room); // Substituir "room" se necessário
// Adicione mais dados aqui se quiser salvar outras coisas
ini_close();

show_message("Jogo salvo no Slot " + string(slot) + "!");

}