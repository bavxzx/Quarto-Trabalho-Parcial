import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaAluno(),
    );
  }
}

class MediaAluno extends StatefulWidget {
  @override
  State<MediaAluno> createState() => _MediaAlunoState();
}

class _MediaAlunoState extends State<MediaAluno> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController recuperacaoController = TextEditingController();

  bool temRecuperacao = false;
  String resultado = "";

  void calcularMedia() {
    if (nota1Controller.text.isEmpty ||
        nota2Controller.text.isEmpty) {
      setState(() {
        resultado = "Preencha todas as notas.";
      });
      return;
    }

    double nota1 = double.parse(nota1Controller.text);
    double nota2 = double.parse(nota2Controller.text);

    double media = (nota1 + nota2) / 2;

    if (temRecuperacao) {
      if (recuperacaoController.text.isEmpty) {
        setState(() {
          resultado = "Digite a nota da recuperação.";
        });
        return;
      }

      double recuperacao =
          double.parse(recuperacaoController.text);

      media = (media + recuperacao) / 2;
    }

    String situacao;

    if (media >= 6.0) {
      situacao = "Aprovado";
    } else {
      situacao = "Reprovado";
    }

    setState(() {
      resultado =
          "Média: ${media.toStringAsFixed(1)}\nSituação: $situacao";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Média do Aluno"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nota 1",
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nota 2",
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Checkbox(
                  value: temRecuperacao,
                  onChanged: (value) {
                    setState(() {
                      temRecuperacao = value!;
                    });
                  },
                ),
                const Text("Tem recuperação?")
              ],
            ),

            if (temRecuperacao)
              TextField(
                controller: recuperacaoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Nota da Recuperação",
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calcularMedia,
              child: const Text("Calcular"),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}