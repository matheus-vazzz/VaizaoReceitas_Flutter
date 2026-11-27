class Receita{
  const Receita(this.id, this.nome, this.imagem, this.ingredientes, this.instrucoes, this.tempoPreparo, this.tempoCozimento, this.porcoes, this.dificuldade, this.culinaria, this.nota, this.tiposRefeicao);

  final int id;
  final String nome;
  final String? imagem;
  final List<String> ingredientes;
  final List<String> instrucoes;
  final int? tempoPreparo;
  final int? tempoCozimento;
  final int? porcoes;
  final String? dificuldade;
  final String? culinaria;
  final num? nota;
  final List<String> tiposRefeicao;

  factory Receita.fromJson(Map<String, dynamic> json){
    final id = json['id'];
    if(id is! int){
      throw const FormatException('Receita Inválida');
    }

    final nome = json['name'];
    final imagem = json['image'];
    final ingredientes = json['ingredients'];
    final instrucoes = json['instructions'];
    final tempoPreparo = json['prepTimeMinutes'];
    final tempoCozimento = json['cookTimeMinutes'];
    final porcoes = json['servings'];
    final dificuldade = json['difficulty'];
    final culinaria = json['cuisine'];
    final nota = json['rating'];
    final tiposRefeicao = json['mealType'];

    return Receita(
      id,
      nome is String && nome.trim().isNotEmpty ? nome.trim() : 'Receita sem nome',
      imagem is String && imagem.isNotEmpty ? imagem : null,
      ingredientes is List ? ingredientes.whereType<String>().toList() : <String>[],
      instrucoes is List ? instrucoes.whereType<String>().toList() : <String>[],
      tempoPreparo is int ? tempoPreparo : null,
      tempoCozimento is int ? tempoCozimento : null,
      porcoes is int && porcoes > 0 ? porcoes : null,
      dificuldade is String ? dificuldade : null,
      culinaria is String ? culinaria : null,
      nota is num ? nota : null,
      tiposRefeicao is List ? tiposRefeicao.whereType<String>().toList() : <String>[],
    );
  }

  String textoTempo(){
    final preparo = tempoPreparo;
    final cozimento = tempoCozimento;
    if(preparo != null && cozimento != null){
      return '${preparo + cozimento} min';
    }
    if(preparo != null){
      return '$preparo min de preparo';
    }
    if(cozimento != null){
      return '$cozimento min de cozimento';
    }
    return 'Tempo não informado';
  }

  String textoPorcoes(){
    final valor = porcoes;
    if(valor == null){
      return 'Não informadas';
    }
    return '$valor';
  }

  String textoDificuldade(){
    final valor = dificuldade;
    if(valor == null){
      return 'Dificuldade não informada';
    }
    return valor;
  }

  String textoCulinaria(){
    final valor = culinaria;
    if(valor == null){
      return 'Culinária não informada';
    }
    return valor;
  }

  String textoNota(){
    final valor = nota;
    if(valor == null){
      return 'Sem avaliação';
    }
    return '${valor.toStringAsFixed(1).replaceAll('.', ',')} / 5';
  }

  String textoRefeicao(){
    if(tiposRefeicao.isEmpty){
      return 'Não informado';
    }
    return tiposRefeicao.join(', ');
  }

  String textoIngredientes(){
    if(ingredientes.isEmpty){
      return 'Ingredientes não informados.';
    }
    String texto = '';
    for(int i = 0; i < ingredientes.length; i++){
      texto += '• ${ingredientes[i]}\n';
    }
    return texto.trim();
  }

  String textoInstrucoes(){
    if(instrucoes.isEmpty){
      return 'Modo de preparo não informado.';
    }
    String texto = '';
    for(int i = 0; i < instrucoes.length; i++){
      texto += '${i + 1}. ${instrucoes[i]}\n\n';
    }
    return texto.trim();
  }
}