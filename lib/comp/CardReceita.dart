import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:vaizao_receitas/telas/DetalheReceita.dart';
import 'package:flutter/material.dart';

class CardReceita extends StatelessWidget {
  const CardReceita({super.key, required this.receita});
  final Receita receita;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => DetalheReceita(receita: receita)
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: bege,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text(
                  receita.tipo,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: vermelho),
                ),
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receita.nome,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: carvao),
                  ),
                  SizedBox(height: 6),
                  Text("${receita.tempo} • ${receita.dificuldade}", style: TextStyle(color: cinza)),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: mostarda,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      receita.nota,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: carvao),
                    ),
                  ),
                ],
              ),
            ),
            Icon(receita.favorito ? Icons.favorite : Icons.favorite_border, color: vermelho),
          ],
        ),
      ),
    );
  }
}