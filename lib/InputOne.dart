import 'package:flutter/material.dart';
import 'package:sleep_calculator/components/Header.dart';

import 'components/SCButton.dart';

class InputOne extends StatefulWidget {
  const InputOne({Key? key}) : super(key: key);

  @override
  State<InputOne> createState() => _InputOne();
}

class _InputOne extends State<InputOne> {
  double _currentAgeValue = 21;
  double _currentDurationValue = 8;
  Map data = {};
  @override
  Widget build(BuildContext context) {
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
                Column(
                  children: [
                    Text(
                      "How old are you?",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      _currentAgeValue.toInt().toString() +
                          (_currentAgeValue > 1 ? ' years old' : ' year old'),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      width: 500,
                      child: Slider(
                        thumbColor: Color(0xFFE8B592),
                        activeColor: Color(0xFFE8B592),
                        inactiveColor: Color(0x25E8B592),
                        value: _currentAgeValue,
                        min: 1,
                        max: 100,
                        onChanged: (double value) {
                          setState(() {
                            _currentAgeValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      "How long do you want to sleep?",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      _currentDurationValue.toInt().toString() +
                          (_currentDurationValue > 1 ? ' hours' : ' hour'),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      width: 500,
                      child: Slider(
                        thumbColor: Color(0xFFE8B592),
                        activeColor: Color(0xFFE8B592),
                        inactiveColor: Color(0x25E8B592),
                        value: _currentDurationValue,
                        min: 1,
                        max: 17,
                        onChanged: (double value) {
                          setState(() {
                            _currentDurationValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SCButton(
                  label: 'NEXT',
                  onPress: () {
                    Navigator.pushNamed(context, '/inputTwo', arguments: {
                      'age': _currentAgeValue.toInt(),
                      'duration': _currentDurationValue.toInt()
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
