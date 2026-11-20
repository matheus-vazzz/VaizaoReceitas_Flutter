import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/telas/ErroCarregamento.dart';
import 'package:flutter/material.dart';

class Carregando extends StatelessWidget {
  const Carregando({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Explorar receitas", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: vermelho),
                  SizedBox(height: 16,),
                  Text("Carregando receitas…", style: TextStyle(color: cinza),),
                ],
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (_) => ErroCarregamento()
                ));
              },
              child: Text("Simular erro"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}