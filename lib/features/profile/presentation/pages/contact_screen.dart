import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(title: "Связатся с нами"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Image.asset("assets/images/appInfo_1.png"),
            ),
            Gap(80.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Возникли вопросы?",
                  style: AppTextStyles.black18Medium.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Gap(10.h),
                Text(
                  "Наша поддержка проконсультирует Вас\nпо любым возникшим вопросам.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.black16Regular.copyWith(
                    color: AppColors.black.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            Gap(50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _contactItem(
                  name: "Whatsapp",
                  function: () async {
                    String phone = "+996990551380";
                    String message = "Здравствуйте, у меня есть вопросы.";
                    final url =
                        'https://wa.me/$phone?text=${Uri.parse(message)}';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      return await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                _contactItem(
                  name: "Instagram",
                  function: () async {
                    const url = 'https://www.instagram.com/akademia.rosta/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      return await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                _contactItem(
                  name: "Facebook",
                  function: () async {
                    const url = 'https://www.facebook.com/rost.kg/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      return await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                _contactItem(
                  name: "Web",
                  function: () async {
                    const url = 'https://rost.kg/';
                    if (await canLaunchUrl(Uri.parse(url))) {
                      return await launchUrl(Uri.parse(url));
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactItem({required String name, required Function()? function}) {
    return GestureDetector(
      onTap: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.main,
                  blurRadius: 8.r,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Image.asset("assets/icons/$name.png"),
          ),
          Gap(10.h),
          Text(name),
        ],
      ),
    );
  }
}
