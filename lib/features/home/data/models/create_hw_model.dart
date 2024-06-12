import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:intl/intl.dart';

class CreateHWModel extends CreateHWEntity {
  const CreateHWModel({
    required super.pupilId,
    required super.groupId,
    required super.deadline,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pupilId'] = pupilId;
    data['groupId'] = groupId;
    data['deadline'] = DateFormat('yyyy-MM-dd').format(deadline ?? DateTime.now());
    return data;
  }
}
