import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/sign_in.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sing_in_state.dart';
part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInUseCase signInUseCase;
  SignInBloc({required this.signInUseCase}) : super(SignInInitialState()) {
    on<SingInButtonEvent>((event, emit) async {
      emit(SignInLoadingState());
      final errorOrSuccess = await signInUseCase.call(event.signInEntity);
      print(errorOrSuccess);
      errorOrSuccess.fold(
          (error) => emit(
                SignInErrorState(
                  message: AppUtils.mapFailureToMessage(error),
                ),
              ), (success) {
        emit(SignInLoadedState());
      });
    });
  }
}
