import 'package:flutter/material.dart';
import 'package:sleep_calculator/components/SCButton.dart';

import 'components/Header.dart';

class ResultPage extends StatelessWidget {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("TRY TO GO TO BED AT",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontSize: 30,
                        )),
                Text(data['recTime'],
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          fontSize: 65,
                          fontWeight: FontWeight.w800,
                        )),
                SCButton(
                    label: "START OVER",
                    onPress: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),
                SizedBox(height: 50),
                Text(
                  "For people around your age, it is recommended that\nyou should have around",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20),
                Text(
                  data['recSleep'],
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontSize: 40,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
