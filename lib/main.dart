import 'package:flutter/material.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gatitos Love',
      routes: routes,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable para controlar la posición del botón "No"
  double _noButtonTopOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Quieres Ser mi Novia?',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/gatitos.jpg'),
            const SizedBox(height: 50),
            SizedBox(
              height: 100, // Altura del contenedor para los botones
              child: Stack(
                children: [
                  Positioned(
                    left: 70,
                    top: 0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loading');
                        // navigatorKey.currentState?.pushNamed('/loading');
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 40),
                        ),
                      ),
                      child: const Text(
                        'Sí',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    left: 200, // Inicialmente al costado del botón "Sí"
                    top: _noButtonTopOffset,
                    duration: const Duration(milliseconds: 300),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          // Cambia la posición del botón "No" hacia arriba o abajo
                          _noButtonTopOffset =
                              _noButtonTopOffset == 0 ? -50 : 50;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 40),
                        ),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
