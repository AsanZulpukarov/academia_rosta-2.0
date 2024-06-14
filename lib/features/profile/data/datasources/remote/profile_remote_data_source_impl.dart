import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/core/shared/shared_pref_source.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/edit_password_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/mark_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/models/user_info_model.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/main.dart';

import 'package:http/http.dart' as http;

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<bool> editPassword(EditPasswordEntity editPasswordEntity) async {
    EditPasswordModel editPasswordModel = EditPasswordModel(
      password: editPasswordEntity.password,
      confirmPassword: editPasswordEntity.confirmPassword,
    );
    final url = Uri.parse('${Constants.baseUrl}api/profile/change-password');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };
    print(editPasswordModel.toJson());
    print(jsonEncode(editPasswordModel.toJson()));
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(editPasswordModel.toJson()),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<Map<String, MarkEntity>> getMyStatistic(int id) async {
    final url = Uri.parse(
        '${Constants.baseUrl}pupil/profile-old/api/full-statistics?subjectId=$id');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonData = jsonDecode(responseBody);
      List<String> keysMap = jsonData.keys.toList();
      Map<String, MarkEntity> result = {};
      for (int i = 0; i < keysMap.length; i++) {
        result[keysMap[i]] = MarkModel.fromJson(jsonData[keysMap[i]]);
      }
      return result;
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<UserInfoModel> getUserInfo() async {
    final url = Uri.parse('${Constants.baseUrl}api/profile');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      Constants.user.avatar = prefs.getInt(SharedPrefSource.imageKey);
      return UserInfoModel.fromJson(jsonData);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> logoutAccount() async {
    prefs.clear();
  }

  @override
  Future<bool> updateUserInfo(UserInfoEntity userInfoEntity) async {
    final url = Uri.parse('${Constants.baseUrl}api/profile');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(UserInfoModel(
        firstname: userInfoEntity.firstname,
        lastname: userInfoEntity.lastname,
        email: userInfoEntity.email,
        username: userInfoEntity.username,
        phoneNumber: userInfoEntity.phoneNumber,
      ).toJson()),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<List<SubjectModel>> getMySubjects() async {
    final url = Uri.parse('${Constants.baseUrl}api/profile/my-subjects');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    print(response.statusCode);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return (jsonData as List)
          .map((subject) => SubjectModel.fromJson(subject))
          .toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> changeAvatar(int avatar) {
    Constants.user.setAvatar(avatar);
    return prefs.setInt(SharedPrefSource.imageKey, avatar);
  }

  @override
  Future<Map<String, MarkEntity>> getStudentStatistic(
      int subjectId, int studentId) async {
    final url = Uri.parse(
        '${Constants.baseUrl}api/statistics/by-pupil?subjectId=$subjectId&userId=$studentId');
    print(url);
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonData = jsonDecode(responseBody);
      List<String> keysMap = jsonData.keys.toList();
      Map<String, MarkEntity> result = {};
      for (int i = 0; i < keysMap.length; i++) {
        result[keysMap[i]] = MarkModel.fromJson(jsonData[keysMap[i]]);
      }
      return result;
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }
}
