  bool gerarpopup = false;
  List<String> numeros = ['33213', '12918', '00112', '29876', '56128', '00003', '99911'];
  List<String> palavras = ['Quantas', 'Diretorias','A empresa', 'Medicina', 'Júnior', 'Possui','?'];
  String rfinal = '4';

  String tabela(String valor) {
    int i = 0;
    String p = 'abracadabra';
    while (i < numeros.length ) {
      if(numeros[i] == valor) {
        p = palavras[i];
        gerarpopup = true;
        return p;
      }
      else{
        i = i + 1;
        gerarpopup = false;
      }
    }
    return p;
  }

bool checafinal(String resposta) {
    if (resposta == rfinal) {
      return true;
    }
    else {
      return false;
    }
}
