import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/ListaFavoritos.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VAIZAO RECEITAS", style: TextStyle(fontWeight: FontWeight.bold, color: vermelho, letterSpacing: 1)),
        backgroundColor: creme,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: favoritosAlterados,
        builder: (context, valor, filho){
          if(favoritos.isEmpty){
            return Center(
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(24),
            itemCount: favoritos.length + 1,
            itemBuilder: (_, i){
              if(i == 0){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Favoritos", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
                    SizedBox(height: 8,),
                    Text("Receitas salvas nesta sessão. Toque no coração para remover.", style: TextStyle(color: cinza),),
                    SizedBox(height: 20,),
                  ],
                );
              }
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                child: CardReceita(receita: favoritos[i - 1]),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 1),
    );
  }
}