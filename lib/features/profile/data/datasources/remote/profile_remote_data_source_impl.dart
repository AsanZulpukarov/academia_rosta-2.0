import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';

import 'package:http/http.dart' as http;

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<void> editPassword(EditPasswordEntity editPasswordEntity) async {
    EditPasswordModel editPasswordModel = EditPasswordModel(password: editPasswordEntity.password, confirmPassword: editPasswordEntity.confirmPassword);
    final url = Uri.parse('${Constants.baseUrl}api/users/update-user');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };
    final response = await http.patch(
      url,
      headers: headers,
      body: editPasswordModel.toJson(),);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> getMyStatistic() {
    // TODO: implement getMyStatistic
    throw UnimplementedError();
  }

  @override
  Future<UserInfoModel> getUserInfo() async {
    final url =
        Uri.parse('${Constants.baseUrl}api/users/user-details?userId=1');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);

      return UserInfoModel.fromJson(jsonData);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> logoutAccount() {
    // TODO: implement logoutAccount
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserInfo(UserInfoEntity userInfoEntity) async {
    final url = Uri.parse('${Constants.baseUrl}api/users/update-user');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.patch(
      url,
      headers: headers,
      body: UserInfoModel(firstname: userInfoEntity.firstname, lastname: userInfoEntity.lastname , email: userInfoEntity.email, username: userInfoEntity.username, phoneNumber: userInfoEntity.phoneNumber).toJson(),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }
}
