import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_code_event.dart';
part 'reset_password_code_state.dart';

class ResetPasswordCodeBloc
    extends Bloc<ResetPasswordCodeEvent, ResetPasswordCodeState> {
  ResetPasswordCodeBloc() : super(ResetPasswordCodeInitialState());
}
