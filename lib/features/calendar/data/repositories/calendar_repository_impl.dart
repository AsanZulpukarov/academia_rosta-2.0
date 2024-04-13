import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/calendar/domain/entites/point_entity.dart';
import 'package:academia_rosta_diplom/features/calendar/domain/repositories/calendar_repository.dart';
import 'package:dartz/dartz.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl();

  @override
  Future<Either<Failure, List<PointEntity>>> getPointByDate() {
    // TODO: implement getPointByDate
    throw UnimplementedError();
  }
}
