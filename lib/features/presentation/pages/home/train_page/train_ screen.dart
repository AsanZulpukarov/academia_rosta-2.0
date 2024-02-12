import 'package:academia_rosta_diplom/features/presentation/pages/home/train_page/show_train_number_screen.dart';
import 'package:academia_rosta_diplom/features/presentation/pages/home/train_page/train_character_screen.dart';
import 'package:flutter/material.dart';

class TrainScreen extends StatefulWidget {
  @override
  _TrainScreenState createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFrontVisible = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  void _flipCoin() {
    if (_isFrontVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    _isFrontVisible = !_isFrontVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _flipCoin();
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return _isFrontVisible
                  ? TrainCharacterScreen()
                  : ShowTrainNumberScreen();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
