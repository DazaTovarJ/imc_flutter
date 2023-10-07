import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  double massCalculated = 0;

  void calculate() {
    setState(() {
      double p = double.parse(weightCtrl.text);
      double a = double.parse(heightCtrl.text);
      massCalculated = (p / (a * a));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IMC APP")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Consulta tu Índice de Masa Corporal",
              style: TextStyle(
                  fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Para tener una Vida Saludable",
              style: TextStyle(
                  fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image.asset("assets/img/estado_imc.jpg", height: 150),
            buildFields(weightCtrl, "Por favor, Digite su Peso (KG)",
                TextInputType.number),
            buildFields(heightCtrl, "Por favor, Digite su altura (Mts)",
                TextInputType.number),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  calculate();
                },
                child: const Text("Calcular"),
            ),
            massCalculated != 0 ? Text("SU INDICE DE MASA CORPORAL ES: $massCalculated") : Container(),
          ],
        ),
      ),
    );
  }

  Widget buildFields(
      TextEditingController ctrl, String label, TextInputType type) {
    return TextField(
      controller: ctrl,
      keyboardType: type,
      decoration: InputDecoration(labelText: label),
    );
  }
}
