import 'package:academia_rosta_diplom/features/presentation/pages/learn_app_screen.dart';
import 'package:flutter/material.dart';

import '../../../app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LearnAppScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 140,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'АКАДЕМИЯ РОСТА',
                style: AppTextStyles.black16Medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
