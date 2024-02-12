import 'dart:async';
import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowTrainNumberScreen extends StatefulWidget {
  const ShowTrainNumberScreen({Key? key}) : super(key: key);

  @override
  State<ShowTrainNumberScreen> createState() => _ShowTrainNumberScreenState();
}

class _ShowTrainNumberScreenState extends State<ShowTrainNumberScreen> {
  final List<int> _list = [1, 896666, -3, 4, 5, 6, 7, 8, 9];
  int _currentValue = 0;
  late Timer _timer; // Добавлен таймер

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Отмена таймера при уничтожении виджета
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentValue = (_currentValue + 1) % _list.length;
        if (_currentValue == _list.length - 1) {
          _stopTimer();
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberContainer(_currentValue - 1),
            _buildNumberContainer(_currentValue),
            _buildNumberContainer(_currentValue + 1),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberContainer(int index) {
    double _height = 180;
    if (_isValidIndex(index)) {
      return Container(
        height: _height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getColorContainer(index),
        ),
        child: Text(
          _list[index].toString(),
          style: AppTextStyles.black26.copyWith(
            fontSize: (6 * (18 - _list[index].toString().length)).sp,
            color: _getColorText(index),
          ),
        ),
      );
    } else {
      return Container(
        height: _height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _getColorContainer(index),
        ),
      );
    }
  }

  bool _isValidIndex(int index) {
    return index >= 0 && index < _list.length;
  }

  Color _getColorContainer(int index) {
    return index == _currentValue
        ? Colors.blue.withOpacity(0.5)
        : Colors.blue.withOpacity(0.1);
  }

  Color _getColorText(int index) {
    return index == _currentValue
        ? AppColors.black
        : AppColors.black.withOpacity(0.4);
  }
}
