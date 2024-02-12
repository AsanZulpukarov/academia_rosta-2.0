import 'package:academia_rosta_diplom/features/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/material.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarSecond(
        title: "Студент",
      ),
      body: SingleChildScrollView(),
    );
  }
}
