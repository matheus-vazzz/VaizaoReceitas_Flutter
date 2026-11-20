import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receitas.dart';
import 'package:flutter/material.dart';
import 'package:vaizao_receitas/telas/NenhumFavorito.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

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
            CardReceita(receita: lasanha),
            SizedBox(height: 24,),
            OutlinedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (_) => NenhumFavorito()
                ));
              },
              child: Text("Remover dos favoritos"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 1),
    );
  }
}