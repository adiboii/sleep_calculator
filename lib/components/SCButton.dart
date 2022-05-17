import 'package:flutter/material.dart';

class SCButton extends StatelessWidget {
  String label;
  VoidCallback onPress;
  SCButton({required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(label,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                )),
      ),
    );
  }
}
