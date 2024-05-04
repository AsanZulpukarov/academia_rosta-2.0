import 'dart:async';
import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowTrainNumberScreen extends StatefulWidget {
  final List<int> list;
  const ShowTrainNumberScreen({Key? key, required this.list}) : super(key: key);

  @override
  State<ShowTrainNumberScreen> createState() => _ShowTrainNumberScreenState();
}

class _ShowTrainNumberScreenState extends State<ShowTrainNumberScreen> {
  int _currentValue = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentValue = (_currentValue + 1) % widget.list.length;
        if (_currentValue == widget.list.length - 1) {
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
        padding: const EdgeInsets.all(20),
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
    double height = 180;
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
        ? Colors.blue.withOpacity(0.5)
        : Colors.blue.withOpacity(0.1);
  }

  Color _getColorText(int index) {
    return index == _currentValue
        ? AppColors.black
        : AppColors.black.withOpacity(0.4);
  }
}
