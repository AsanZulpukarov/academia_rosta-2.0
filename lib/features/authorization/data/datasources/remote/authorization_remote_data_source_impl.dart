import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';

import 'package:http/http.dart' as http;

class AuthorizationRemoteDataSourceImpl extends AuthorizationRemoteDataSource {

AuthorizationRemoteDataSourceImpl();

  @override
  Future<void> resetPassword(String username) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> sendCode(String code) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signIn(SignInModel signInModel) async {
    final url = Uri.parse('${Constants.baseUrl}auth/sign-in');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    };
    final body = jsonEncode(signInModel.toJson());

    final response = await http.post(url, headers: headers, body: body);

    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return UserModel.fromJson(jsonData);
    } else {
      print("Asan --> ${response.statusCode} ${responseBody}");
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> signUp(SignUpModel signUpModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}
