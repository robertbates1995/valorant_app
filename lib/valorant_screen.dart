import 'package:flutter/widgets.dart';

class ValorantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xff0f1922),
        child: Image.asset(
          'assets/images/valorant_logo.png',
        ));
  }
}
