import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';

abstract class AuthorizationRemoteDataSource {
  Future<UserModel> signIn(SignInModel signInModel);
  Future<void> signUp(SignUpModel signUpModel);
  Future<void> resetPassword(String username);
  Future<void> sendCode(String code);

}
