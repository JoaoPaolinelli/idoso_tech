import 'package:flutter/material.dart';
import 'package:idosotech/pages/onboarding/widgets/splash_effect.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashEffect(),
    );
  }
}
