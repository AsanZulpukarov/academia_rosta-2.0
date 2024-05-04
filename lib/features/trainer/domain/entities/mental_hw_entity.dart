import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/enums/hw_type_enum.dart';
import 'package:equatable/equatable.dart';

class MentalHWEntity extends Equatable {
  final int? id;
  final DateTime? createDate;
  final DateTime? deadLine;
  final List<ExerciseTrainEntity>? exercises;
  final HWTypeEnum? hwType;
  final UserInfoEntity? userInfo;

  const MentalHWEntity({
    this.id,
    this.createDate,
    this.deadLine,
    this.exercises,
    this.hwType,
    this.userInfo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createDate,
        deadLine,
        exercises,
        hwType,
        userInfo,
      ];
}
