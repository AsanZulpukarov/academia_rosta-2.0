import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_user_info.dart';
import 'package:academia_rosta_diplom/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserInfoUseCase getUserInfoUseCase;

  ProfileBloc(this.getUserInfoUseCase) : super(ProfileInitialState()) {
    on<ProfileEmptyEvent>((event, emit) async {
      emit(ProfileLoadingState());
      final errorOrSuccess = await getUserInfoUseCase.call(Object());
      errorOrSuccess.fold(
        (l) => emit(
          ProfileErrorState(AppUtils.mapFailureToMessage(l)),
        ),
        (r) => emit(ProfileLoadedState(r)),
      );
    });
    on<ProfileExitAccountEvent>((event, emit) async {
      print(prefs.get(SharedPrefSource.tokenKey));
      await prefs.clear();
      print(prefs.get(SharedPrefSource.tokenKey));
    });
  }
}
