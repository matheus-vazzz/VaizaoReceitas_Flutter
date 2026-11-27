import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:flutter/material.dart';

class EstadoCarregando extends StatelessWidget {
  const EstadoCarregando({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: vermelho),
            SizedBox(height: 16,),
            Text(texto, textAlign: TextAlign.center, style: TextStyle(color: cinza),),
          ],
        ),
      ),
    );
  }
}