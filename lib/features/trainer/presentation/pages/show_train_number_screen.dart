import 'dart:async';
import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/main_button_widget.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/my_app_bar_second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ShowTrainNumberScreen extends StatefulWidget {
  final List<int> list;
  final double speed;

  const ShowTrainNumberScreen(
      {Key? key, required this.list, required this.speed})
      : super(key: key);

  @override
  State<ShowTrainNumberScreen> createState() => _ShowTrainNumberScreenState();
}

class _ShowTrainNumberScreenState extends State<ShowTrainNumberScreen> {
  int _currentValue = 0;
  late Timer _timer;
  late int answer;
  bool isShowNumber = true;
  final TextEditingController _answerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    answer = widget.list.last;
    widget.list.removeLast();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: (widget.speed * 1000).toInt()), (timer) {
      setState(() {
        _currentValue++;
        if (_currentValue == widget.list.length) {
          _stopTimer();
          isShowNumber = false;
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarSecond(title: "Тренажер"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isShowNumber
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberContainer(_currentValue - 1),
                  _buildNumberContainer(_currentValue),
                  _buildNumberContainer(_currentValue + 1),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _answerController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Напишити ответ",
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              const BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              const BorderSide(color: AppColors.borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide:
                              const BorderSide(color: AppColors.borderColor),
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  MainButtonWidget(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Text(
                      "Проверить",
                      style: AppTextStyles.black14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (int.parse(_answerController.text) ==
                            widget.list.last) {
                          await showDialog(
                              context: context,
                              builder: (_) {
                                return Scaffold(
                                  backgroundColor: AppColors.transparent,
                                  body: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 16.h),
                                      height: 200.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: AppColors.green,
                                            size: 50.r,
                                          ),
                                          Gap(10.h),
                                          Text(
                                            "Правильно",
                                            style: AppTextStyles.black16Medium
                                                .copyWith(
                                              color: AppColors.green,
                                            ),
                                          ),
                                          Gap(10.h),
                                          Text("Правильный ответ: ${widget.list.last}",style: AppTextStyles.black16Medium,),
                                          Gap(20.h),
                                          MainButtonWidget(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: Text(
                                                'Закрыть',
                                                style: AppTextStyles.black16
                                                    .copyWith(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          await showDialog(
                              context: context,
                              builder: (_) {
                                return Scaffold(
                                  backgroundColor: AppColors.transparent,
                                  body: Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 16.h),
                                      height: 200.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: AppColors.mainRed,
                                            size: 50.r,
                                          ),
                                          Gap(10.h),
                                          Text(
                                            "Неправильно",
                                            style: AppTextStyles.black16Medium
                                                .copyWith(
                                              color: AppColors.mainRed,
                                            ),
                                          ),
                                          Gap(10.h),
                                          Text("Правильный ответ: ${widget.list.last}",style: AppTextStyles.black16Medium,),
                                          Gap(20.h),
                                          MainButtonWidget(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: Text(
                                                'Закрыть',
                                                style: AppTextStyles.black16
                                                    .copyWith(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                          Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildNumberContainer(int index) {
    double height = 180.h;
    if (_isValidIndex(index)) {
      return Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getColorContainer(index),
        ),
        child: Text(
          widget.list[index].toString(),
          style: AppTextStyles.black26.copyWith(
            fontSize: (6 * (18 - widget.list[index].toString().length)).sp,
            color: _getColorText(index),
          ),
        ),
      );
    } else {
      return Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getColorContainer(index),
        ),
      );
    }
  }

  bool _isValidIndex(int index) {
    return index >= 0 && index < widget.list.length;
  }

  Color _getColorContainer(int index) {
    return index == _currentValue
        ? AppColors.mainColor.withOpacity(0.5)
        : AppColors.mainColor.withOpacity(0.1);
  }

  Color _getColorText(int index) {
    return index == _currentValue
        ? AppColors.white
        : AppColors.black.withOpacity(0.5);
  }
}
