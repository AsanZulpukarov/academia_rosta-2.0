import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitialState()) {
    on<EditProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
