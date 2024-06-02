import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_lesson_history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_history_event.dart';

part 'lesson_history_state.dart';

class LessonHistoryBloc extends Bloc<LessonHistoryEvent, LessonHistoryState> {
  GetAllLessonHistoryUseCase getAllLessonHistoryUseCase;

  LessonHistoryBloc(this.getAllLessonHistoryUseCase)
      : super(LessonHistoryInitialState()) {
    on<LessonHistoryEmptyEvent>((event, emit) async {
      emit(LessonHistoryLoadingState());
      final errorOrSuccess = await getAllLessonHistoryUseCase.call(event.id);
      errorOrSuccess.fold(
          (l) => emit(LessonHistoryErrorState(AppUtils.mapFailureToMessage(l))),
          (r) => emit(LessonHistoryLoadedState(lessons: r)));
    });
  }
}
