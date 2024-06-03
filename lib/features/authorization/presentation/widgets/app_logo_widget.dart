import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  final double width;

  const AppLogoWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
