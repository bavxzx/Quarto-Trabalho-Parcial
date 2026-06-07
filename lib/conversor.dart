import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConversorTemperatura(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConversorTemperatura extends StatefulWidget {
  @override
  State<ConversorTemperatura> createState() => _ConversorTemperaturaState();
}

class _ConversorTemperaturaState extends State<ConversorTemperatura> {
  TextEditingController temperaturaController = TextEditingController();

  String opcao = "C → F";
  String resultado = "";

  void converterTemperatura() {
    double temperatura = double.parse(temperaturaController.text);
    double convertido;

    if (opcao == "C → F") {
      convertido = (temperatura * 9 / 5) + 32;

      setState(() {
        resultado = "${convertido.toStringAsFixed(2)} °F";
      });
    } else {
      convertido = (temperatura - 32) * 5 / 9;

      setState(() {
        resultado = "${convertido.toStringAsFixed(2)} °C";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Temperatura"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: temperaturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Temperatura",
              ),
            ),

            const SizedBox(height: 15),

            DropdownButton<String>(
              value: opcao,
              items: const [
                DropdownMenuItem(
                  value: "C → F",
                  child: Text("C → F"),
                ),
                DropdownMenuItem(
                  value: "F → C",
                  child: Text("F → C"),
                ),
              ],
              onChanged: (valor) {
                setState(() {
                  opcao = valor!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: converterTemperatura,
              child: const Text("Converter"),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}