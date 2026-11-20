import 'package:vaizao_receitas/dados/Cores.dart';
import 'package:vaizao_receitas/telas/Principal.dart';
import 'package:flutter/material.dart';

class VaizaoReceitas extends StatelessWidget {
  const VaizaoReceitas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: vermelho, primary: vermelho),
        scaffoldBackgroundColor: creme,
      ),
      home: const Principal(),
    );
  }
}