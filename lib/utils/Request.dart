import 'dart:convert';

import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:http/http.dart' as http;

class ErroStatus{
  const ErroStatus(this.codigo);
  final int codigo;
}

Future<List<Receita>> buscar(Uri endereco) async {
  final resposta = await http.get(endereco).timeout(const Duration(seconds: 10));

  if(resposta.statusCode != 200){
    throw ErroStatus(resposta.statusCode);
  }

  final dados = jsonDecode(resposta.body);
  if(dados is! Map<String, dynamic>) throw const FormatException('Formato Invalido');

  final lista = dados['recipes'];
  if(lista is! List) throw const FormatException('Formato Invalido');

  return lista.map((item){
    if(item is! Map<String, dynamic>){
      throw const FormatException('Objeto Invalido');
    }
    return Receita.fromJson(item);
  }).toList();
}

Future<List<Receita>> carregarReceitas(){
  return buscar(Uri.https('dummyjson.com', '/recipes', {'limit': '0'}));
}

Future<List<Receita>> pesquisarReceitas(String termo){
  return buscar(Uri.https('dummyjson.com', '/recipes/search', {'q': termo}));
}

String mensagemDeErro(Object? erro){
  if(erro is ErroStatus){
    return 'o servidor de receitas respondeu com   erro (${erro.codigo}), tente novamente.';
  }
  if(erro is FormatException){
    return 'as receitas chegaram em um formato inesperado, tente novamente.';
  }
  return 'não foi possível conectar, verifique sua internet e tente novamente.';
}