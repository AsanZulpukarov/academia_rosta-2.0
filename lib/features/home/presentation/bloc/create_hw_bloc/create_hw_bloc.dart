import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/create_hw.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_hw_event.dart';

part 'create_hw_state.dart';

class CreateHwBloc extends Bloc<CreateHwEvent, CreateHwState> {
  CreateHWUseCase createHWUseCase;

  CreateHwBloc(this.createHWUseCase) : super(CreateHwInitialState()) {
    on<CreateHWSaveEvent>((event, emit) async {
      emit(CreateHWLoadingState());
      final errorOrSuccess = await createHWUseCase.call(event.createHWEntity);
      errorOrSuccess.fold((l) =>
          emit(
            CreateHWErrorState(message: AppUtils.mapFailureToMessage(l),),), (
          r) => emit(CreateHWLoadedState(hwEntity: r),),);
    });
  }
}
