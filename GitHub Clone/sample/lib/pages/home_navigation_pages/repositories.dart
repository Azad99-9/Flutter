import 'package:flutter/material.dart';
import 'package:sample/classes/components.dart';
import 'package:sample/classes/designSystem.dart';

class Repositories extends StatelessWidget {
  const Repositories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: defaultAppBar(title: 'Repositories'),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          color: backColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                warningTxt1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: headlineColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                warningTxt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: headlineColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
