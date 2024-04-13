import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sing_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpUseCase signUpUseCase;
  SignUpBloc({required this.signUpUseCase}) : super(SignUpInitialState()) {
    on<SingInButtonEvent>(event, emit) async {
      emit(SignUpLoadingState());
      final errorOrSuccess = await signUpUseCase.call(event.signInEntity);
      errorOrSuccess.fold(
          (error) => emit(
                SignUpErrorState(
                  message: AppUtils.mapFailureToMessage(error),
                ),
              ), (success) {
        emit(SignUpLoadedState());
      });
    }
  }
}
