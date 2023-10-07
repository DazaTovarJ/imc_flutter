import 'package:flutter/material.dart';

class Sueldo extends StatefulWidget {
  const Sueldo({super.key});

  @override
  State<Sueldo> createState() => _SueldoState();
}

class _SueldoState extends State<Sueldo> {
  TextEditingController nombre = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController hora = TextEditingController();
  String nombrep = "";
  double calcsueldo = 0;

  void calculate() {
    setState(() {
      nombrep = nombre.text;
      double v = double.parse(valor.text);
      double h = double.parse(hora.text);
      calcsueldo = (v * h);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUELDO APP"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "CONSULTE SU SUELDO A PAGAR",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset("assets/img/pago.jpeg", height: 170),
                  buildFields(nombre, "Por favor, Digite su Nombre",
                      TextInputType.text),
                  const SizedBox(height: 20),
                  buildFields(valor, "Por favor, Digite el Valor",
                      TextInputType.number),
                  const SizedBox(height: 20),
                  buildFields(hora, "Por favor, Digite la Cantidad de Horas",
                      TextInputType.number),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: const ButtonStyle(
                      textStyle: MaterialStatePropertyAll<TextStyle>(
                        TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 7, 139, 255),
                        ),
                      ),
                    ),
                    onPressed: () {
                      calculate();
                    },
                    child: const Text("Calcular Sueldo"),
                  ),
                  calcsueldo != 0
                      ? Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                              "Estimado $nombrep, usted recibirá un sueldo de "
                              "${calcsueldo.toStringAsFixed(1)}",
                              textAlign: TextAlign.center,
                            ),
                        ],
                      )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      }),
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
