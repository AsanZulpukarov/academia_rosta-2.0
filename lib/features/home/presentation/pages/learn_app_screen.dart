import 'package:academia_rosta_diplom/features/authorization/presentation/widgets/bottom_app_name.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_text_styles.dart';
import '../../../../app_theme.dart';
import '../../../authorization/presentation/pages/sign_in/sign_in_screen.dart';
import 'home/home_screen.dart';

class AppInfo {
  String image = "";
  String label = "";

  AppInfo({required imageNumber, required this.label}) {
    image = "assets/images/appInfo_$imageNumber.png";
  }
}

class LearnAppScreen extends StatefulWidget {
  const LearnAppScreen({Key? key}) : super(key: key);

  @override
  State<LearnAppScreen> createState() => _LearnAppScreenState();
}

class _LearnAppScreenState extends State<LearnAppScreen> {
  final List<AppInfo> _appInfo = [
    AppInfo(imageNumber: "1", label: "Развивающие курсы для\n вашего ребенка."),
    AppInfo(
        imageNumber: "2",
        label:
            "Академия Роста — школа ментальной арифметики\n №1 в Кыргызстане"),
    AppInfo(
        imageNumber: "3",
        label:
            "Будем рады видеть Вас!\nВ наших центрах \nв Кыргызстане и в соседних странах.\n"),
  ];

  int _currentIndex = 0;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400.h,
                  alignment: Alignment.topCenter,
                  child: IndexedStack(
                    index: _currentIndex,
                    children: [
                      _scrollImageAndLabel(_currentIndex),
                      _scrollImageAndLabel(_currentIndex),
                      _scrollImageAndLabel(_currentIndex),
                    ],
                  ),
                ),
                MainButtonWidget(
                  onPressed: () {
                    setState(() {
                      if (_currentIndex < _appInfo.length - 1) {
                        _currentIndex++;
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(20.0),
                  child: Text(
                    'Следующий',
                    style: AppTextStyles.black16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Gap(10),
                MainButtonWidget(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  backgroundColor: AppColors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.blackOpacity65, width: 2),
                  child: Text(
                    'Пропустить',
                    style: AppTextStyles.black16.copyWith(
                      color: AppColors.blackOpacity65,
                    ),
                  ),
                ),
              ],
            ),
            const BottomAppName(),
          ],
        ),
      ),
    );
  }

  Widget _scrollImageAndLabel(int index) {
    return Column(
      children: [
        Image.asset(
          _appInfo.elementAt(index).image,
          height: 240.h,
          width: 240.w,
        ),
        const Gap(10),
        Text(
          _appInfo.elementAt(index).label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.800000011920929),
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
