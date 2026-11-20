import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:flutter/material.dart';

class ErroCarregamento extends StatelessWidget {
  const ErroCarregamento({super.key});

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
            Text("Não foi possível carregar as receitas.", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text("Verifique sua conexão e tente novamente.", textAlign: TextAlign.center, style: TextStyle(color: cinza),),
            SizedBox(height: 32,),
            FilledButton(
                onPressed: (){
                  Navigator.popUntil(context, (rota) => rota.isFirst);
                },
                child: Text("Tentar novamente")
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}