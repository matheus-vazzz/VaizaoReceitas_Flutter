import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:flutter/material.dart';

class NenhumFavorito extends StatelessWidget {
  const NenhumFavorito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VAIZAO RECEITAS", style: TextStyle(fontWeight: FontWeight.bold, color: vermelho, letterSpacing: 1)),
        backgroundColor: creme,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Nenhum favorito", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text("Marque uma receita como favorita para encontrá-la aqui.", textAlign: TextAlign.center, style: TextStyle(color: cinza),),
            SizedBox(height: 32,),
            FilledButton(
                onPressed: (){
                  Navigator.popUntil(context, (rota) => rota.isFirst);
                },
                child: Text("Explorar receitas")
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 1),
    );
  }
}