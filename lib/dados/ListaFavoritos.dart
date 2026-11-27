import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:flutter/material.dart';

final List<Receita> favoritos = [];
final favoritosAlterados = ValueNotifier<int>(0);

bool ehFavorito(Receita receita){
  return favoritos.any((item) => item.id == receita.id);
}

void alternarFavorito(Receita receita){
  if(ehFavorito(receita)){
    favoritos.removeWhere((item) => item.id == receita.id);
  } else {
    favoritos.add(receita);
  }
  favoritosAlterados.value++;
}