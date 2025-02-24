import 'package:flutter/material.dart';
import 'package:idosotech/pages/onboarding/new_user.dart';
import 'package:idosotech/pages/onboarding/sign_in_page.dart';
import 'package:idosotech/pages/onboarding/tela_inicial.dart';
import 'package:idosotech/pages/onboarding/widgets/splash_effect.dart';
import 'package:idosotech/pages/pagina_teste.dart';

import 'pages/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NewUser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
