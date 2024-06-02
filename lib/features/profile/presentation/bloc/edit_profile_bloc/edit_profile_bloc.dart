import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/change_avatar.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/update_user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  int selectImageIndex = 0;
  GetUserInfoUseCase getUserInfoUseCase;
  UpdateUserInfoUseCase updateUserInfoUseCase;
  ChangeAvatarUseCase changeAvatarUseCase;

  EditProfileBloc({
    required this.getUserInfoUseCase,
    required this.updateUserInfoUseCase,
    required this.changeAvatarUseCase,
  }) : super(EditProfileInitialState()) {
    on<EditProfileEmptyEvent>((event, emit) async {
      emit(EditProfileLoadingState());
      final errorOrSuccess = await getUserInfoUseCase.call(Object());
      errorOrSuccess.fold(
        (l) => emit(
          EditProfileErrorState(
            message: AppUtils.mapFailureToMessage(l),
          ),
        ),
        (r) => emit(EditProfileLoadedState(userInfoEntity: r)),
      );
    });

    on<EditProfileChangeImageEvent>((event, emit) async {
      await changeAvatarUseCase.call(event.avatar);
    });

    on<EditProfileSaveEvent>((event, emit) async {
      emit(EditProfileLoadingState());
      final errorOrSuccess =
          await updateUserInfoUseCase.call(event.userInfoEntity);
      errorOrSuccess.fold(
          (l) => emit(
                EditProfileErrorState(
                  message: AppUtils.mapFailureToMessage(l),
                ),
              ), (r) {
        emit(EditProfileSavedState());
      });
    });
  }
}
