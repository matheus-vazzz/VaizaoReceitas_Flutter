import 'package:vaizao_receitas/comp/ImagemReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/ListaFavoritos.dart';
import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:flutter/material.dart';

class DetalheReceita extends StatelessWidget {
  const DetalheReceita({super.key, required this.receita});
  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receita", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: creme,
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: favoritosAlterados,
            builder: (context, valor, filho){
              return IconButton(
                onPressed: () => alternarFavorito(receita),
                icon: Icon(ehFavorito(receita) ? Icons.favorite : Icons.favorite_border, color: vermelho),
              );
            },
          ),
          SizedBox(width: 8,),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImagemReceita(receita: receita, largura: double.infinity, altura: 200),
            SizedBox(height: 20,),
            Text(receita.nome, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 6,),
            Text("${receita.textoCulinaria()} • ${receita.textoDificuldade()} • ${receita.textoNota()}", style: TextStyle(color: cinza),),
            SizedBox(height: 16,),
            Text(
              "• Tempo total: ${receita.textoTempo()}\n• Porções: ${receita.textoPorcoes()}\n• Refeição: ${receita.textoRefeicao()}",
              style: TextStyle(fontSize: 15, color: carvao),
            ),
            SizedBox(height: 24,),
            Text("Ingredientes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text(receita.textoIngredientes(), style: TextStyle(fontSize: 15, color: carvao),),
            SizedBox(height: 24,),
            Text("Modo de preparo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text(receita.textoInstrucoes(), style: TextStyle(fontSize: 15, color: carvao),),
            SizedBox(height: 24,),
            Text("Role para ler todos os ingredientes e passos.", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: cinza),),
          ],
        ),
      ),
    );
  }
}