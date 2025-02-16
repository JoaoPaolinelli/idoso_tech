import 'package:flutter/material.dart';
import 'package:idosotech/widgets/app_bar_widget.dart';
import 'package:idosotech/widgets/grid_widget.dart';
import 'package:idosotech/widgets/welcome_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 193, 243, 100),
      body: Column(
        children: [
          // Widget - App Bar
          AppBarWidget(),

          SizedBox(height: 10),

          //Widget - Welcome Card
          WelcomeCardWidget(),

          // Widget - Avaliable Classes Category
          GridWidget(),
        ],
      ),
    );
  }
}
