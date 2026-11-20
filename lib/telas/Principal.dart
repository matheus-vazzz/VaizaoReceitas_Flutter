import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/telas/Pesquisa.dart';
import 'package:vaizao_receitas/dados/Receitas.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VAIZAO RECEITAS", style: TextStyle(fontWeight: FontWeight.bold, color: vermelho, letterSpacing: 1)),
        backgroundColor: creme,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Receitas", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text("Pesquise uma receita pelo nome.", style: TextStyle(color: cinza),),
            SizedBox(height: 20,),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Buscar pelo nome",
                  prefixIcon: Icon(Icons.search),
                  border: const OutlineInputBorder()
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => Pesquisa()
                ));
              },
            ),
            SizedBox(height: 12,),
            FilledButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => Pesquisa()
                  ));
                },
                child: Text("Buscar receitas")
            ),
            SizedBox(height: 32,),
            Text("Receitas disponíveis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text("Selecione uma receita para ver o preparo.", style: TextStyle(color: cinza),),
            SizedBox(height: 16,),
            CardReceita(receita: lasanha),
            SizedBox(height: 12,),
            CardReceita(receita: torta),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}