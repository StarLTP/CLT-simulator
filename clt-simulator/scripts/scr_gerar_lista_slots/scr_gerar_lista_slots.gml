function scr_gerar_lista_slots(){
	
// ---------------------  Retorna um array com os nomes dos slots de save --------------------- 
// ---------------------  Slots existentes mostram "(Salvo)", e o 4º item é "Voltar" --------------------- 

var lista = [];

for (var i = 0; i < 3; i++) {
    var nome_arquivo = "save" + string(i + 1) + ".ini";
    
    if (file_exists(nome_arquivo)) {
        lista[i] = "Slot " + string(i + 1) + " (Salvo)";
    } else {
        lista[i] = "Slot " + string(i + 1);
    }
}

lista[3] = "Voltar";

return lista;

}