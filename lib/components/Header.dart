import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/image.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          SizedBox(
            child: SvgPicture.asset(
              "images/slepteim.svg",
              height: 150,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "SLEEP BETTER • WAKE BETTER",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
