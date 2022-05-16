import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SleepCalculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class SleepCalculator extends StatefulWidget {
  const SleepCalculator({Key? key}) : super(key: key);

  @override
  State<SleepCalculator> createState() => _SleepCalculatorState();
}

class _SleepCalculatorState extends State<SleepCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "slep teim",
                  ),
                  Text("SLEEP BETTER • WAKE BETTER"),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text("Hello"),
            ),
          ],
        ),
      ),
    );
  }
}
