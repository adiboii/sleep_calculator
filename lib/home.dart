import 'package:flutter/material.dart';
import 'package:sleep_calculator/themes/AppTheme.dart';
import 'package:sleep_calculator/components/Header.dart';

import 'components/SCButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            Container(
              child: Text(
                "Welcome to slep teim, the app that \nfinds your perfect sleep.",
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
            SCButton(
              label: 'START',
              onPress: () {
                Navigator.pushNamed(context, '/inputOne');
              },
            ),
          ],
        ),
      ),
    );
  }
}
