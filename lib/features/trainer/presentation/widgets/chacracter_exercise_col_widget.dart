import 'package:academia_rosta_diplom/app_text_styles.dart';
import 'package:academia_rosta_diplom/features/trainer/presentation/widgets/character_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class CharacterExerciseWidget extends StatelessWidget {
  const CharacterExerciseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Характеристики упражнения",
          style: AppTextStyles.black16Medium,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: CharacterContainerWidget(
                title: "Скорость",
                numberCharacter: 1.00,
                numberIncDec: 0.2,
                isFixDigit: false,
              ),
            ),
            Gap(22),
            Expanded(
              child: CharacterContainerWidget(
                title: "Разрядность",
                numberCharacter: 1.0,
                numberIncDec: 1.0,
              ),
            ),
            Gap(22),
            Expanded(
              child: CharacterContainerWidget(
                title: "Количество\nпеременных",
                numberCharacter: 1.0,
                numberIncDec: 1.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
