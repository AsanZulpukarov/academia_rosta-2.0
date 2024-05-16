import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_up_entity.dart';

abstract class AuthorizationRemoteDataSource {
  Future<UserModel> signIn(SignInEntity signInEntity);
  Future<void> signUp(SignUpEntity signUpModel);
  Future<void> resetPassword(String username);
  Future<void> sendCode(String code);

}
