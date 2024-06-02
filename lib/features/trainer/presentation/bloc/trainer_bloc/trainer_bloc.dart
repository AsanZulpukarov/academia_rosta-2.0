import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/entities/exercise_train_entity.dart';
import 'package:academia_rosta_diplom/features/trainer/domain/usecases/get_numbers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trainer_event.dart';

part 'trainer_state.dart';

class TrainerBloc extends Bloc<TrainerEvent, TrainerState> {
  final GetNumbersUseCase getNumbersUseCase;

  TrainerBloc({required this.getNumbersUseCase})
      : super(
          TrainerInitialState(
            exerciseTrainEntity: ExerciseTrainEntity(
              speed: 1,
              numberCount: 1,
              digitsCount: 1,
            ),
          ),
        ) {
    on<TrainerEvent>((event, emit) async {
      print(state.exerciseTrainEntity);
      emit(TrainerLoadingState(exerciseTrainEntity: state.exerciseTrainEntity));
      final errorOrSuccess =
          await getNumbersUseCase.call(state.exerciseTrainEntity);
      errorOrSuccess.fold(
          (l) => emit(
                TrainerErrorState(
                    message: AppUtils.mapFailureToMessage(l),
                    exerciseTrainEntity: state.exerciseTrainEntity),
              ), (r) {
        emit(TrainerLoadedState(
            numbers: r, exerciseTrainEntity: state.exerciseTrainEntity));
      });
    });
  }
}
