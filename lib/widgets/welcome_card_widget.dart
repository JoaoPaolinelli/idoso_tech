import 'package:flutter/material.dart';

class WelcomeCardWidget extends StatelessWidget {
  const WelcomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Stack(
          children: [
            Container(
              // color: Colors.lightBlue,
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                color: Colors.black,
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  width: 300,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    'Bem vindo, João !',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
