import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/usecases/get_group_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'group_info_event.dart';
part 'group_info_state.dart';

class GroupInfoBloc extends Bloc<GroupInfoEvent, GroupInfoState> {
  GetGroupByIdUseCase getGroupByIdUseCase;
  GroupInfoBloc({required this.getGroupByIdUseCase}) : super(GroupInfoInitialState()) {
    on<GroupInfoEmptyEvent>((event, emit) async {
      emit(GroupInfoLoadingState());
      final errorOrSuccess = await getGroupByIdUseCase.call(event.id);
      errorOrSuccess.fold((l) => emit(GroupInfoErrorState(AppUtils.mapFailureToMessage(l))), (r){
        emit(GroupInfoLoadedState(r));
      });
    });
  }
}
