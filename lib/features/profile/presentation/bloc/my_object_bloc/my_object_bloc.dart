import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/subject_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_subjects.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_object_event.dart';

part 'my_object_state.dart';

class MyObjectBloc extends Bloc<MySubjectEvent, MySubjectState> {
  GetMySubjectsUseCase getMySubjectsUseCase;

  MyObjectBloc(this.getMySubjectsUseCase) : super(MySubjectInitialState()) {
    on<MySubjectEmptyEvent>((event, emit) async {
      emit(MySubjectLoadingState());
      final errorOrSuccess = await getMySubjectsUseCase.call(Object());
      errorOrSuccess.fold(
        (l) => emit(
          MySubjectErrorState(
            message: AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(
          MySubjectLoadedState(objects: r),
        ),
      );
    });
  }
}
