import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_hw_by_student_id.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_hw_student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hw_event.dart';

part 'hw_state.dart';

class HWBloc extends Bloc<HWEvent, HWState> {
  GetAllHWByStudentIdUseCase getAllHWByStudentIdUseCase;
  GetHWStudentUseCase getHWStudentUseCase;

  HWBloc(this.getAllHWByStudentIdUseCase, this.getHWStudentUseCase)
      : super(HWInitialState()) {
    on<HWEmptyEvent>((event, emit) async {
      emit(HWLoadingState());
      final errorOrSuccess = await getAllHWByStudentIdUseCase.call(
        HWParams(subjectId: event.idSubject, studentId: event.idStudent),
      );
      errorOrSuccess.fold(
          (l) => emit(
                HWErrorState(message: AppUtils.mapFailureToMessage(l)),
              ),
          (r) => emit(HWLoadedState(hw: r)));
    });

    on<StudentHWGetEvent>((event, emit) async {
      emit(HWLoadingState());
      final errorOrSuccess = await getHWStudentUseCase.call(event.idSubject);
      errorOrSuccess.fold(
          (l) => emit(
                HWErrorState(message: AppUtils.mapFailureToMessage(l)),
              ),
          (r) => emit(HWLoadedState(hw: r)));
    });
  }
}
