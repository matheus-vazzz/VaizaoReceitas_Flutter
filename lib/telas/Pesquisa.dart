import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receitas.dart';
import 'package:vaizao_receitas/telas/Carregando.dart';
import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final termo = TextEditingController();
  String? mensagemErro;
  String? termoPesquisado;
  bool achouLasanha = false;
  bool achouTorta = false;

  void validarTermo(String valor){
    setState(() {
      if(valor.trim().isEmpty){
        mensagemErro = "Digite um nome para pesquisar.";
      } else {
        mensagemErro = null;
      }
    });
  }

  void pesquisar(){
    validarTermo(termo.text);

    if(mensagemErro != null){
      setState(() {
        termoPesquisado = null;
      });
      return;
    }

    final texto = termo.text.trim();
    final busca = texto.toLowerCase();
    setState(() {
      termoPesquisado = texto;
      achouLasanha = lasanha.nome.toLowerCase().contains(busca);
      achouTorta = torta.nome.toLowerCase().contains(busca);
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pesquisando por: $texto"))
    );
  }

  void limparPesquisa(){
    setState(() {
      termo.clear();
      termoPesquisado = null;
      mensagemErro = null;
    });
  }

  Widget montarResultado(){
    if(termoPesquisado == null){
      return SizedBox();
    }

    if(achouLasanha || achouTorta){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Resultados para “$termoPesquisado”", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
          SizedBox(height: 8,),
          Text("Toque na receita para ver o preparo.", style: TextStyle(color: cinza),),
          SizedBox(height: 16,),
          achouLasanha ? CardReceita(receita: lasanha) : SizedBox(),
          SizedBox(height: 12,),
          achouTorta ? CardReceita(receita: torta) : SizedBox(),
          SizedBox(height: 24,),
          OutlinedButton(
            onPressed: limparPesquisa,
            child: Text("Limpar pesquisa"),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Nenhum resultado", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: carvao),),
        SizedBox(height: 8,),
        Text("Não encontramos receitas para esse nome. Tente outro termo.", textAlign: TextAlign.center, style: TextStyle(color: cinza),),
        SizedBox(height: 24,),
        FilledButton(
            onPressed: limparPesquisa,
            child: Text("Alterar pesquisa")
        ),
        SizedBox(height: 12,),
        OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (_) => Carregando()
            ));
          },
          child: Text("Ver todas as receitas"),
        ),
      ],
    );
  }

  @override
  void dispose(){
    termo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar receitas", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: creme,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Qual receita você procura?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: carvao),),
            SizedBox(height: 20,),
            TextField(
              controller: termo,
              decoration: InputDecoration(
                  labelText: "Nome da receita",
                  hintText: "Buscar pelo nome",
                  prefixIcon: Icon(Icons.search),
                  errorText: mensagemErro,
                  border: const OutlineInputBorder()
              ),
              onChanged: validarTermo,
            ),
            SizedBox(height: 12,),
            FilledButton(
                onPressed: pesquisar,
                child: Text("Pesquisar")
            ),
            SizedBox(height: 16,),
            Text("Você pode buscar por parte do nome da receita.", style: TextStyle(color: cinza),),
            SizedBox(height: 32,),
            montarResultado(),
          ],
        ),
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}