  bool gerarpopup = false;
  List<String> numeros = ['33213', '12345'];
  List<String> palavras = ['aaa', 'bbb'];

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


