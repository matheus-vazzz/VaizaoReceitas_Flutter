import 'package:vaizao_receitas/dados/Cores.dart';
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
          Icon(receita.favorito ? Icons.favorite : Icons.favorite_border, color: vermelho),
          SizedBox(width: 16,),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                  color: bege,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text(
                  receita.tipo,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: vermelho, letterSpacing: 2),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(receita.nome, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 6,),
            Text("${receita.categoria} • ${receita.dificuldade} • ${receita.nota}", style: TextStyle(color: cinza),),
            SizedBox(height: 16,),
            Text("• Tempo total: ${receita.tempo}\n• Porções: ${receita.porcoes}", style: TextStyle(fontSize: 15, color: carvao),),
            SizedBox(height: 24,),
            Text("Ingredientes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text(receita.ingredientes, style: TextStyle(fontSize: 15, color: carvao),),
            SizedBox(height: 24,),
            Text("Modo de preparo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text(receita.preparo, style: TextStyle(fontSize: 15, color: carvao),),
            SizedBox(height: 24,),
            Text("Role para ler todos os ingredientes e passos.", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: cinza),),
          ],
        ),
      ),
    );
  }
}