import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/calendar/domain/repositories/calendar_repository.dart';
import 'package:dartz/dartz.dart';

class GetPointByDateUseCase extends UseCase<void,Object>{
  final CalendarRepository calendarRepository;

  GetPointByDateUseCase({required this.calendarRepository});
  @override
  Future<Either<Failure, void>> call(Object params) async{
    return Right(await calendarRepository.getPointByDate());
  }
}