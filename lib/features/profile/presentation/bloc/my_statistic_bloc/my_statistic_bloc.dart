import 'package:academia_rosta_diplom/core/app_utils/app_utils.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/usecases/get_my_statistic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_statistic_event.dart';

part 'my_statistic_state.dart';

class MyStatisticBloc extends Bloc<MyStatisticEvent, MyStatisticState> {
  GetMyStatisticUseCase getMyStatisticUseCase;

  MyStatisticBloc(this.getMyStatisticUseCase)
      : super(MyStatisticInitialState()) {
    on<MyStatisticEmptyEvent>((event, emit) async {
      emit(MyStatisticLoadingState());
      final errorOrSuccess = await getMyStatisticUseCase.call(event.id);
      errorOrSuccess.fold(
          (l) => emit(
                MyStatisticErrorState(
                  message: AppUtils.mapFailureToMessage(l),
                ),
              ), (r) {
        emit(MyStatisticLoadedState(r));
      });
    });
  }
}
