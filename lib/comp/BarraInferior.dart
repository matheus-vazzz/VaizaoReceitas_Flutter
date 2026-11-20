import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/telas/Favoritos.dart';
import 'package:flutter/material.dart';

class BarraInferior extends StatelessWidget {
  const BarraInferior({super.key, required this.abaAtiva});
  final int abaAtiva;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: abaAtiva == 0 ? vermelho : Colors.white, width: 3)),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.popUntil(context, (rota) => rota.isFirst);
                  },
                  child: Text(
                    "EXPLORAR",
                    style: TextStyle(fontWeight: FontWeight.bold, color: abaAtiva == 0 ? vermelho : cinza),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: abaAtiva == 1 ? vermelho : Colors.white, width: 3)),
                ),
                child: TextButton(
                  onPressed: (){
                    if(abaAtiva != 1){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (_) => Favoritos()
                      ), (rota) => rota.isFirst);
                    }
                  },
                  child: Text(
                    "FAVORITOS",
                    style: TextStyle(fontWeight: FontWeight.bold, color: abaAtiva == 1 ? vermelho : cinza),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}