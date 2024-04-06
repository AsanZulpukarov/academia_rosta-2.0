import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CharacterContainerWidget extends StatefulWidget {
  final String title;
  final double numberCharacter;
  final double numberIncDec;
  final Color buttonBackgroundColor;
  final double? heightContainer;
  final bool isFixDigit;
  const CharacterContainerWidget({
    Key? key,
    required this.title,
    required this.numberCharacter,
    required this.numberIncDec,
    this.isFixDigit = true,
    this.buttonBackgroundColor = AppColors.main,
    this.heightContainer = 100,
  }) : super(key: key);

  @override
  State<CharacterContainerWidget> createState() =>
      _CharacterContainerWidgetState();
}

class _CharacterContainerWidgetState extends State<CharacterContainerWidget> {
  late double _numberCharacter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberCharacter = widget.numberCharacter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: AppTextStyles.black14.copyWith(fontSize: 14),
        ),
        Gap(4),
        Container(
          height: widget.heightContainer,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.black,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    widget.isFixDigit
                        ? _numberCharacter.toStringAsFixed(0)
                        : _numberCharacter.toStringAsFixed(1),
                    style: AppTextStyles.black26,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            if (_numberCharacter - widget.numberIncDec > 0.2) {
                              setState(() {
                                _numberCharacter -= widget.numberIncDec;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.black,
                        width: 1,
                        thickness: 1,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _numberCharacter += widget.numberIncDec;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
