import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_event.dart';
import 'package:academia_rosta_diplom/features/home/presentation/bloc/attendance_bloc/attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitialState()) {
    on<AttendanceTapSaveEvent>((event, emit) {
      emit(AttendanceLoadingState());
    });
  }
}
