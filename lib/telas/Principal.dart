import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/comp/EstadoCarregando.dart';
import 'package:vaizao_receitas/comp/EstadoErro.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:vaizao_receitas/telas/Pesquisa.dart';
import 'package:vaizao_receitas/utils/Request.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late Future<List<Receita>> receitas;

  @override
  void initState(){
    super.initState();
    receitas = carregarReceitas();
  }

  void abrirPesquisa(){
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => Pesquisa()
    ));
  }

  Widget cabecalho(int quantidade){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Receitas", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: carvao),),
        SizedBox(height: 8,),
        Text("Pesquise uma receita pelo nome.", style: TextStyle(color: cinza),),
        SizedBox(height: 20,),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
              hintText: "Buscar pelo nome",
              prefixIcon: Icon(Icons.search),
              border: const OutlineInputBorder()
          ),
          onTap: abrirPesquisa,
        ),
        SizedBox(height: 12,),
        FilledButton(
            onPressed: abrirPesquisa,
            child: Text("Buscar receitas")
        ),
        SizedBox(height: 32,),
        Text("Receitas disponíveis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
        SizedBox(height: 8,),
        Text("$quantidade receitas. Selecione uma para ver o preparo.", style: TextStyle(color: cinza),),
        SizedBox(height: 16,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VAIZAO RECEITAS", style: TextStyle(fontWeight: FontWeight.bold, color: vermelho, letterSpacing: 1)),
        backgroundColor: creme,
      ),
      body: FutureBuilder<List<Receita>>(
        future: receitas,
        builder: (context, estado){
          if(estado.connectionState != ConnectionState.done){
            return EstadoCarregando(texto: "Carregando receitas…");
          }

          if(estado.hasError){
            return EstadoErro(
              mensagem: mensagemDeErro(estado.error),
              aoTentarNovamente: (){
                setState(() {
                  receitas = carregarReceitas();
                });
              },
            );
          }

          final itens = estado.data ?? <Receita>[];
          if(itens.isEmpty){
            return Center(child: Text("Nenhuma receita disponível no momento.", style: TextStyle(color: cinza),));
          }

          return ListView.builder(
            padding: EdgeInsets.all(24),
            itemCount: itens.length + 1,
            itemBuilder: (_, i){
              if(i == 0){
                return cabecalho(itens.length);
              }
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                child: CardReceita(receita: itens[i - 1]),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}