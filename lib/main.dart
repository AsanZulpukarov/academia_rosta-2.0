import 'dart:async';

import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/home/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
late final SharedPreferences prefs;
void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPrefSource.getInstance();
    initializeDateFormatting().then((_) => runApp(const MyApp()));
  }, (error, stack) {
    print(error);
    print(stack);
    print(231);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
          ],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
          home: const SplashScreen(),
        );
      },
    );
  }
}
