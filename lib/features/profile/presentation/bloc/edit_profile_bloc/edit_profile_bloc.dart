import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  int selectImageIndex = 0;
  UserInfoEntity? userInfoEntity;
  EditProfileBloc() : super(EditProfileInitialState()) {
    on<EditProfileEmptyEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<EditProfileChangeImageEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<EditProfileSaveEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
