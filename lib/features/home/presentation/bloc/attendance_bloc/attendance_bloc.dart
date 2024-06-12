import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/post_attendance_students.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  PostAttendanceUseCase postAttendanceUseCase;

  AttendanceBloc(this.postAttendanceUseCase) : super(AttendanceInitialState()) {
    on<AttendanceTapSaveEvent>((event, emit) async {
      emit(AttendanceLoadingState());
      final errorOrSuccess =
          await postAttendanceUseCase.call(event.attendanceEntity);
      errorOrSuccess.fold(
        (l) => emit(
          AttendanceErrorState(
            AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(
          AttendanceSavedState(),
        ),
      );
    });
  }
}
