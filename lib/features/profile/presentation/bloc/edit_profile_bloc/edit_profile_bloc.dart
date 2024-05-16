import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/user_entity.dart';
import 'package:academia_rosta_diplom/features/home/presentation/widgets/home/loading_state_widget.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/update_user_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  int selectImageIndex = 0;
  UserInfoEntity? userInfoEntity;
  GetUserInfoUseCase getUserInfoUseCase;
  UpdateUserInfoUseCase updateUserInfoUseCase;

  EditProfileBloc(
      {required this.getUserInfoUseCase, required this.updateUserInfoUseCase})
      : super(EditProfileInitialState()) {
    on<EditProfileEmptyEvent>((event, emit) async {
      emit(EditProfileLoadingState());
      final errorOrSuccess = await getUserInfoUseCase.call(Object());
      errorOrSuccess.fold(
          (l) => emit(
                EditProfileErrorState(
                  message: AppUtils.mapFailureToMessage(l),
                ),
              ),
          (r) => emit(EditProfileLoadedState(userInfoEntity: r)));
    });

    on<EditProfileChangeImageEvent>((event, emit) {
      // TODO: implement event handler
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
