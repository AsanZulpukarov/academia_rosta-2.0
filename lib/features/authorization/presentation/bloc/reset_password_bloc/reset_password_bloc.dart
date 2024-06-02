import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/reset_password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc({required this.resetPasswordUseCase})
      : super(ResetPasswordInitialState()) {
    on<ResetPasswordButtonTapEvent>((event, emit) async {
      emit(ResetPasswordLoadingState());
      final errorOrSuccess = await resetPasswordUseCase.call(event.username);
      errorOrSuccess.fold(
          (error) => emit(
              ResetPasswordErrorState(AppUtils.mapFailureToMessage(error))),
          (r) {
        emit(ResetPasswordLoadedState());
      });
    });
  }
}
