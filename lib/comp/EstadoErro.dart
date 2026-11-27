import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:flutter/material.dart';

class EstadoErro extends StatelessWidget {
  const EstadoErro({super.key, required this.mensagem, required this.aoTentarNovamente});
  final String mensagem;
  final VoidCallback aoTentarNovamente;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Não foi possível carregar as receitas.", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 8,),
            Text(mensagem, textAlign: TextAlign.center, style: TextStyle(color: cinza),),
            SizedBox(height: 32,),
            FilledButton(
                onPressed: aoTentarNovamente,
                child: Text("Tentar novamente")
            ),
          ],
        ),
      ),
    );
  }
}