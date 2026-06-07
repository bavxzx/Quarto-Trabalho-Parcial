import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MeuApp());
}
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdivinheNumero(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class AdivinheNumero extends StatefulWidget {
  @override
  State<AdivinheNumero> createState() => _AdivinheNumeroState();
}

class _AdivinheNumeroState extends State<AdivinheNumero> {
  TextEditingController palpiteController = TextEditingController();

  int numeroSecreto = Random().nextInt(100) + 1;
  int tentativas = 0;
  String mensagem = "Tente adivinhar um número entre 1 e 100";

  void verificarPalpite() {
    int palpite = int.parse(palpiteController.text);

    tentativas++;

    if (palpite < numeroSecreto) {
      setState(() {
        mensagem = "Maior";
      });
    } else if (palpite > numeroSecreto) {
      setState(() {
        mensagem = "Menor";
      });
    } else {
      setState(() {
        mensagem = "Acertou!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adivinhe o Número"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: palpiteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite seu palpite",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: verificarPalpite,
              child: const Text("Tentar"),
            ),

            const SizedBox(height: 20),

            Text(
              mensagem,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              "Tentativas: $tentativas",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}