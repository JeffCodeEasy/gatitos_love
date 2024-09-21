import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyGirlfriend extends StatelessWidget {
  const MyGirlfriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ya lo sabía MUACK 😘',
              style: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.w700),
            ),
            Lottie.asset(
                'assets/animations/dog.json'),
          ],
        ),
      ),
    );
  }
}
