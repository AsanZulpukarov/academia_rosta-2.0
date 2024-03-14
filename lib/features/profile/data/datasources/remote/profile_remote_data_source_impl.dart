import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';

import 'package:http/http.dart' as http;

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<void> editPassword(EditPasswordModel editPasswordModel) {
    // TODO: implement editPassword
    throw UnimplementedError();
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
  Future<void> updateUserInfo(UserInfoModel userInfoModel) async {
    final url = Uri.parse('${Constants.baseUrl}api/users/update-user');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.patch(
      url,
      headers: headers,
      body: userInfoModel.toJson(),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);

      // return UserInfoModel.fromJson(jsonData);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }
}
