import 'package:vaizao_receitas/comp/ImagemReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/ListaFavoritos.dart';
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
            ImagemReceita(receita: receita, largura: 80, altura: 80),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receita.nome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: carvao),
                  ),
                  SizedBox(height: 6),
                  Text("${receita.textoTempo()} • ${receita.textoDificuldade()}", style: TextStyle(fontSize: 13, color: cinza)),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: mostarda,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      receita.textoNota(),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: carvao),
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: favoritosAlterados,
              builder: (context, valor, filho){
                return IconButton(
                  onPressed: () => alternarFavorito(receita),
                  icon: Icon(ehFavorito(receita) ? Icons.favorite : Icons.favorite_border, color: vermelho),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}