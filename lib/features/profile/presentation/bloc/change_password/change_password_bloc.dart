import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/change_password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  bool isVisible = true;
  ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordBloc({required this.changePasswordUseCase})
      : super(ChangePasswordInitialsState()) {
    on<ChangePasswordSaveEvent>((event, emit) async {
      emit(ChangePasswordLoadingState());
      final errorOrSuccess =
          await changePasswordUseCase.call(event.editPasswordEntity);
      errorOrSuccess.fold(
          (l) => emit(ChangePasswordErrorState(
              message: AppUtils.mapFailureToMessage(l))), (r) {
        emit(ChangePasswordLoadedState());
      });
    });
  }
}
