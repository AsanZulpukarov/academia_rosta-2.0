import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'group_info_event.dart';
part 'group_info_state.dart';

class GroupInfoBloc extends Bloc<GroupInfoEvent, GroupInfoState> {
  GroupInfoBloc() : super(GroupInfoInitialState()) {
    emit(GroupInfoLoadingState());
  }
}
