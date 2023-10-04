import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  TextEditingController peso = TextEditingController();

  TextEditingController altura = TextEditingController();

  double massCalculated = 0;

  void Calcular() {
    setState(() {
      double p = double.parse(peso.text);

      double a = double.parse(altura.text);

      massCalculated = (p / (a * a));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IMC APP")),
      body: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Consulta tu Índice de Masa Corporal",
              style: TextStyle(
                  fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Para tener una Vida Saludable",
              style: TextStyle(
                  fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Image.asset("assets/img/estado_imc.jpg")
          ],
        ),
      ),
    );
  }
}
