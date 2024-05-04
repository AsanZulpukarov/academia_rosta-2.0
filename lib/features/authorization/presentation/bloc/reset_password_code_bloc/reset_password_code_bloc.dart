import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/usecases/send_code.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_code_event.dart';

part 'reset_password_code_state.dart';

class ResetPasswordCodeBloc
    extends Bloc<ResetPasswordCodeEvent, ResetPasswordCodeState> {
  SendCodeUseCase sendCodeUseCase;

  ResetPasswordCodeBloc({required this.sendCodeUseCase})
      : super(ResetPasswordCodeInitialState()) {
    on<ResetPasswordButtonTapCodeEvent>((event, emit) async {
      emit(ResetPasswordCodeLoadingState());
      final errorOrSuccess = await sendCodeUseCase.call(event.code);
      errorOrSuccess.fold(
        (l) => emit(
          ResetPasswordCodeErrorState(
            message: AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(
          ResetPasswordCodeLoadedState(),
        ),
      );
    });
  }
}
