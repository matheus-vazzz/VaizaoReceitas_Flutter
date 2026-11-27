import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:flutter/material.dart';

class ImagemReceita extends StatelessWidget {
  const ImagemReceita({super.key, required this.receita, required this.largura, required this.altura});
  final Receita receita;
  final double largura;
  final double altura;

  @override
  Widget build(BuildContext context) {
    final semImagem = Container(
      width: largura,
      height: altura,
      color: bege,
      child: Center(
        child: Text(
          "SEM IMAGEM",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: vermelho),
        ),
      ),
    );

    final endereco = receita.imagem;
    if(endereco == null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: semImagem,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        endereco,
        width: largura,
        height: altura,
        fit: BoxFit.cover,
        errorBuilder: (context, erro, pilha) => semImagem,
      ),
    );
  }
}