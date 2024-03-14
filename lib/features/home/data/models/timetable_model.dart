import 'package:academia_rosta_diplom/features/home/domain/entities/group/timetable_entity.dart';

class TimetableModel extends TimetableEntity {
  TimetableModel({
    required monday,
    required tuesday,
    required wednesday,
    required thursday,
    required friday,
    required saturday,
    required sunday,
  }) : super(
          monday: monday,
          tuesday: tuesday,
          wednesday: wednesday,
          thursday: thursday,
          friday: friday,
          saturday: saturday,
          sunday: sunday,
        );

  factory TimetableModel.fromJson(Map<String, dynamic> json) {
    return TimetableModel(
      monday: json['MONDAY'],
      tuesday: json['TUESDAY'],
      wednesday: json['WEDNESDAY'],
      thursday: json['THURSDAY'],
      friday: json['FRIDAY'],
      saturday: json['SATURDAY'],
      sunday: json['SUNDAY'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MONDAY'] = monday;
    data['TUESDAY'] = tuesday;
    data['WEDNESDAY'] = wednesday;
    data['THURSDAY'] = thursday;
    data['FRIDAY'] = friday;
    data['SATURDAY'] = saturday;
    data['SUNDAY'] = sunday;
    return data;
  }
}
