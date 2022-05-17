import 'package:flutter/material.dart';
import 'package:sleep_calculator/components/Header.dart';
import 'package:sleep_calculator/components/SleepCalculator.dart';
import 'package:sleep_calculator/main.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'components/SCButton.dart';

class InputTwo extends StatefulWidget {
  const InputTwo({Key? key}) : super(key: key);

  @override
  State<InputTwo> createState() => _InputTwoState();
}

class _InputTwoState extends State<InputTwo> {
  Map data = {};
  String? hour;
  String? minutes;
  String type = "AM";
  int? period;
  var hourItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  var minItems = ['10', '20', '30', '40', '50', '60'];
  var typeItems = ["AM", "PM"];

  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ToggleSwitch(
                    minWidth: 300.0,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    activeBgColor: [Color(0xFFF8F8F8)],
                    activeFgColor: Colors.black,
                    inactiveFgColor: Color(0xFFF8F8F8),
                    inactiveBgColor: Colors.grey[700],
                    labels: ['I want to wake up at', 'I want to sleep at'],
                    onToggle: (index) {
                      period = index;
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonFormField(
                          value: hour,
                          isDense: true,
                          // validator: (value) =>
                          //     value == null ? 'Please fill out the time' : null,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: hourItems.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              hour = newValue!;
                            });
                          },
                          hint: Text("HR",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonFormField(
                          value: minutes,
                          isDense: true,
                          // validator: (value) =>
                          //     value == null ? 'Please fill out the time' : null,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          items: minItems.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              minutes = newValue!;
                            });
                          },
                          hint: Text("MIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 100,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          value: type.isNotEmpty ? type : null,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          isExpanded: true,
                          underline: SizedBox(),
                          items: typeItems.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              type = newValue!;
                            });
                          },
                          hint: Text("AM",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  SCButton(
                    label: 'CALCULATE',
                    onPress: () {
                      if (hour == null || minutes == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please fill out the time'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Go Back'))
                            ],
                          ),
                        );
                      } else {
                        SleepCalculator sc = SleepCalculator(
                            age: data['age'],
                            sleep: data['duration'],
                            period: period,
                            hours: int.parse(hour!),
                            min: int.parse(minutes!),
                            type: type);
                        print("Recommened Sleep: " + sc.getRecommendedSleep());
                        Navigator.pushNamed(context, '/resultPage', arguments: {
                          'recSleep': sc.getRecommendedSleep(),
                          'recTime': sc.getRecommendedTime()
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
