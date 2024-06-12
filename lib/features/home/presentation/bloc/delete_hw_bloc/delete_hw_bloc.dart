import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/delete_hw_by_id.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_hw_event.dart';

part 'delete_hw_state.dart';

class DeleteHwBloc extends Bloc<DeleteHwEvent, DeleteHwState> {
  DeleteHWByIdUseCase deleteHWByIdUseCase;

  DeleteHwBloc(this.deleteHWByIdUseCase) : super(DeleteHwInitialState()) {
    on<HWDeleteEvent>((event, emit) async {
      emit(DeleteHwLoadingState());
      final errorOrSuccess = await deleteHWByIdUseCase.call(event.idHW);
      errorOrSuccess.fold(
        (l) => emit(
          DeleteHwErrorState(
            message: AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(
          DeleteHwLoadedState(),
        ),
      );
    });
  }
}
