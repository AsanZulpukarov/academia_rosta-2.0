import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/home/home_screen.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/learn_app_screen.dart';
import 'package:academia_rosta_diplom/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isOpen = prefs.getBool(SharedPrefSource.isOpenKey) ?? false;
    String? isSignIn = prefs.getString(SharedPrefSource.tokenKey);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOpen) {
        if (isSignIn == null || isSignIn.isEmpty) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const SignInScreen(),
            ),
          );
        } else {
          // Constants.user = UserModel.fromJson(
          //   {
          //     'token': prefs.getString(SharedPrefSource.tokenKey),
          //     'role': prefs.getString(SharedPrefSource.roleKey),
          //     'avatar': prefs.getString(SharedPrefSource.imageKey),
          //   },
          // );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            ),
          );
        }
      }
      else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LearnAppScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 140.r,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
