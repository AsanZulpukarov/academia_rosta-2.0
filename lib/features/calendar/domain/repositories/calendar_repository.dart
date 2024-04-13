import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/calendar/domain/entites/point_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CalendarRepository {
  Future<Either<Failure, List<PointEntity>>> getPointByDate();
}
