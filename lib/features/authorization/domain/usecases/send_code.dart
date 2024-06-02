import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/core/usecases/usecase.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:dartz/dartz.dart';

class SendCodeUseCase extends UseCase<void, String> {
  final AuthorizationRepository authorizationRepository;

  SendCodeUseCase({required this.authorizationRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await authorizationRepository.sendCode(params);
  }
}
