import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_all_groups.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_groups_student_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'groups_event.dart';

part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GetAllGroupsUseCase getAllGroupsUseCase;
  GetGroupsStudentIdUseCase getGroupsStudentIdUseCase;
  GroupsBloc({required this.getAllGroupsUseCase,required this.getGroupsStudentIdUseCase})
      : super(GroupsInitialState()) {
    on<GroupsEmptyEvent>((event, emit) async {
      emit(GroupsLoadingState());
      final errorOrSuccess = await getAllGroupsUseCase.call("");
      errorOrSuccess.fold(
          (l) => emit(
                GroupsErrorState(
                  AppUtils.mapFailureToMessage(l),
                ),
              ), (r) {
        emit(GroupsLoadedState(r));
      });
    });
    on<GetGroupsStudentIdEvent>((event, emit) async {
      emit(GroupsLoadingState());
      final errorOrSuccess = await getGroupsStudentIdUseCase.call(event.id);
      errorOrSuccess.fold(
          (l) => emit(
                GroupsErrorState(
                  AppUtils.mapFailureToMessage(l),
                ),
              ), (r) {
        emit(GroupsLoadedState(r));
      });
    });
  }
}
