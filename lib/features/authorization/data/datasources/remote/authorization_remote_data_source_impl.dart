import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/datasources/remote/authorization_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_in_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/sign_up_model.dart';
import 'package:academia_rosta_diplom/features/authorization/data/models/user_model.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:academia_rosta_diplom/features/authorization/domain/entities/sign_up_entity.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationRemoteDataSourceImpl extends AuthorizationRemoteDataSource {
  AuthorizationRemoteDataSourceImpl();

  @override
  Future<void> resetPassword(String username) async {
    final url = Uri.parse('${Constants.baseUrl}auth/send-code');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: {"username": username},
    );

    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      // return UserModel.fromJson(jsonData);
    } else {
      print("Asan --> ${response.statusCode} ${responseBody}");
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> sendCode(String code) async {
    final url = Uri.parse('${Constants.baseUrl}auth/send-code');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode({"code": code}),
    );

    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      // return UserModel.fromJson(jsonData);
    } else {
      print("Asan --> ${response.statusCode} ${responseBody}");
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<UserModel> signIn(SignInEntity signInEntity) async {
    SignInModel signInModel = SignInModel(
      username: signInEntity.username,
      password: signInEntity.password,
    );
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
      setToken(jsonData['token']);
      setRole(jsonData['role']);
      return UserModel.fromJson(jsonData);
    } else {
      print("Asan --> ${response.statusCode} ${responseBody}");
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  void setToken(String value) async {
    SharedPreferences sharedPreferences = await SharedPrefSource.getInstance();
    sharedPreferences.setString(SharedPrefSource.tokenKey, value);
  }

  void setRole(String value) async {
    SharedPreferences sharedPreferences = await SharedPrefSource.getInstance();
    sharedPreferences.setString(SharedPrefSource.roleKey, value);
  }

  @override
  Future<void> signUp(SignUpEntity signUpEntity) async {
    SignUpModel signUpModel = SignUpModel(
      firstname: signUpEntity.firstname,
      lastname: signUpEntity.lastname,
      phone: signUpEntity.phone,
      polPerson: signUpEntity.polPerson,
      email: signUpEntity.email,
      bDay: signUpEntity.bDay,
      username: signUpEntity.username,
      password: signUpEntity.password,
      confirmPassword: signUpEntity.confirmPassword,
      branch: signUpEntity.branch,
    );
    final url = Uri.parse('${Constants.baseUrl}auth/sign-in');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    };
    final body = jsonEncode(signUpModel.toJson());

    final response = await http.post(url, headers: headers, body: body);

    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      // return UserModel.fromJson(jsonData);
    } else {
      print("Asan --> ${response.statusCode} $responseBody");
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }
}
