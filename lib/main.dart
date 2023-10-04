import 'package:flutter/material.dart';
import 'package:imc/mass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/mass': (context) => const IMC()
        // '/wage':(context) => WagePage()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: theme.colorScheme.primary),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/mass");
                  },
                  child: const Text("IMC")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "wage");
                  },
                  child: const Text("Calcular Sueldo"))
            ],
          )),
    );
  }
}
