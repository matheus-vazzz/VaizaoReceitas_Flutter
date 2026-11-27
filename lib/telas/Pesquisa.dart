import 'package:vaizao_receitas/comp/BarraInferior.dart';
import 'package:vaizao_receitas/comp/CardReceita.dart';
import 'package:vaizao_receitas/comp/EstadoCarregando.dart';
import 'package:vaizao_receitas/comp/EstadoErro.dart';
import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/dados/Receita.dart';
import 'package:vaizao_receitas/utils/Request.dart';
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
  Future<List<Receita>>? busca;

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
        busca = null;
      });
      return;
    }

    final texto = termo.text.trim();
    setState(() {
      termoPesquisado = texto;
      busca = pesquisarReceitas(texto);
    });
  }

  void tentarNovamente(){
    final texto = termoPesquisado;
    if(texto == null) return;
    setState(() {
      busca = pesquisarReceitas(texto);
    });
  }

  void limparPesquisa(){
    setState(() {
      termo.clear();
      termoPesquisado = null;
      mensagemErro = null;
      busca = null;
    });
  }

  Widget montarResultado(AsyncSnapshot<List<Receita>> estado){
    if(busca == null){
      return SizedBox();
    }

    if(estado.connectionState != ConnectionState.done){
      return EstadoCarregando(texto: "Pesquisando receitas…");
    }

    if(estado.hasError){
      return EstadoErro(mensagem: mensagemDeErro(estado.error), aoTentarNovamente: tentarNovamente);
    }

    final itens = estado.data ?? <Receita>[];
    if(itens.isEmpty){
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
              Navigator.pop(context);
            },
            child: Text("Ver todas as receitas"),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Resultados para “$termoPesquisado”", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: carvao),),
        SizedBox(height: 8,),
        Text("${itens.length} receita(s) encontrada(s). Toque para ver o preparo.", style: TextStyle(color: cinza),),
        SizedBox(height: 16,),
        ...itens.map((receita) => Container(
          margin: EdgeInsets.only(bottom: 12),
          child: CardReceita(receita: receita),
        )),
        SizedBox(height: 12,),
        OutlinedButton(
          onPressed: limparPesquisa,
          child: Text("Limpar pesquisa"),
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
      body: FutureBuilder<List<Receita>>(
        future: busca,
        builder: (context, estado){
          final pesquisando = busca != null && estado.connectionState != ConnectionState.done;

          return SingleChildScrollView(
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
                    onPressed: pesquisando ? null : pesquisar,
                    child: Text(pesquisando ? "Pesquisando…" : "Pesquisar")
                ),
                SizedBox(height: 16,),
                Text("Você pode buscar por parte do nome da receita. Os dados vêm em inglês.", style: TextStyle(color: cinza),),
                SizedBox(height: 32,),
                montarResultado(estado),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BarraInferior(abaAtiva: 0),
    );
  }
}