import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/trainer/data/models/exercise_train_model.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/mental_hw_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/enums/hw_type_enum.dart';

class MentalHWModel extends MentalHWEntity {
  MentalHWModel({
    required id,
    required createDate,
    required deadLine,
    required exercises,
    required hwType,
    required userInfo,
  }) : super(
          id: id,
          createDate: createDate,
          deadLine: deadLine,
          exercises: exercises,
          hwType: hwType,
          userInfo: userInfo,
        );

  factory MentalHWModel.fromJson(Map<String, dynamic> json) {
    return MentalHWModel(
      id: json['id'],
      createDate: json['createDate'],
      deadLine: json['deadLine'],
      exercises: json['exercises'] != null
          ? (json['exercises' as List<dynamic>])
              .map((e) => ExerciseTrainModel.fromJson(e))
              .toList()
          : null,
      hwType: json['hwType'] == "test" ? HWTypeEnum.test : HWTypeEnum.trainer,
      userInfo: json['userInfo'] != null
          ? UserInfoModel.fromJson(json['userInfo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createDate'] = createDate;
    data['deadLine'] = deadLine;
    data['exercises'] = exercises?.map((e) => e).toList();
    data['hwType'] = hwType == HWTypeEnum.test ? 'test' : 'trainer';
    data['userInfo'] = userInfo;
    return data;
  }
}
