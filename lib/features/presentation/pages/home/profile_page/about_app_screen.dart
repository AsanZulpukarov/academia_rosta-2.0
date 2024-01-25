import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: "О приложении"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              padding: const EdgeInsets.all(50),
              child: Image.asset("assets/images/logo.png"),
            ),
            Gap(20),
            Text(
              "Version 1.0.0",
              style: AppTextStyles.black12Medium,
            ),
            Gap(20),
            Text(
              "\t\t\tАкадемия Роста – ведущий центр дополнительного образования для детей с 2015 года. Мы специализируемся в развитии интеллектуальных навыков с использованием уникальных методов, основанных на ментальной арифметике. Наше новое мобильное приложение делает обучение еще более удобным, позволяя детям раскрывать свой потенциал в любом месте."
              "\n\t\t\tС гордостью заявляем, что являемся лидером на местном рынке, имея самую крупную сеть филиалов и расширяясь за пределы Кыргызстана. Присоединяйтесь к Академии Роста – месту, где каждый ребенок находит возможность стать потенциальным гением!",
              style: AppTextStyles.black16Regular.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Gap(20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.h,
                    width: 150.w,
                    child:
                        SvgPicture.asset("assets/images/google_play_logo.svg"),
                  ),
                  Container(
                    height: 50.h,
                    width: 150.w,
                    child: SvgPicture.asset("assets/images/app_store_logo.svg"),
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
