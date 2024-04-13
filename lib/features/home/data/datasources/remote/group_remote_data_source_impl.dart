import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';

import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_by_id_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';

import '../../../../../constants.dart';
import 'group_remote_data_source.dart';

import 'package:http/http.dart' as http;

class GroupRemoteDataSourceImpl extends GroupRemoteDataSource {
  GroupRemoteDataSourceImpl();
  @override
  Future<List<GroupInfoEntity>> getAllGroups() async {
    final url = Uri.parse('${Constants.baseUrl}api/groups');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);

      return (jsonData as List)
          .map((group) => GroupInfoModel.fromJson(group))
          .toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<GroupInfoByIdModel> getGroupById(String id) async {
    final url = Uri.parse('${Constants.baseUrl}api/groups');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      // HttpHeaders.authorizationHeader: "Bearer $token",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);

      return GroupInfoByIdModel.fromJson(jsonData);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  createHWByStudentId() {
    // TODO: implement createHWByStudentId
    throw UnimplementedError();
  }

  @override
  deleteHWById() {
    // TODO: implement deleteHWById
    throw UnimplementedError();
  }

  @override
  deleteHWByStudentId() {
    // TODO: implement deleteHWByStudentId
    throw UnimplementedError();
  }

  @override
  getAllHW() {
    // TODO: implement getAllHW
    throw UnimplementedError();
  }

  @override
  getAllHWByStudentId() {
    // TODO: implement getAllHWByStudentId
    throw UnimplementedError();
  }

  @override
  getAllLessonHistory() {
    // TODO: implement getAllLessonHistory
    throw UnimplementedError();
  }

  @override
  getLastThreeLessonHistory() {
    // TODO: implement getLastThreeLessonHistory
    throw UnimplementedError();
  }

  @override
  postAttendanceStudents() {
    // TODO: implement postAttendanceStudents
    throw UnimplementedError();
  }

  @override
  postGradeByStudentsId() {
    // TODO: implement postGradeByStudentsId
    throw UnimplementedError();
  }
}

class GroupRemoteDataSourceImplFake implements GroupRemoteDataSource {
  @override
  Future<List<GroupInfoEntity>> getAllGroups() async {
    var jsonData = [
      {
        "id": 4,
        "name": "Талгар-Английский-1",
        "teacher": "Талгар Тилекматов",
        "subject": "Ментальная арифметика"
      },
      {
        "id": 2,
        "name": "Марсел-Менталка-1",
        "teacher": "Талгар Тилекматов",
        "subject": "Ментальная арифметика"
      },
      {
        "id": 3,
        "name": "Марсел-Русский-1",
        "teacher": "Талгар Тилекматов",
        "subject": "Английский-язык"
      },
      {
        "id": 6,
        "name": "Талгар-Английский-2",
        "teacher": "Талгар Тилекматов",
        "subject": "Английский-язык"
      }
    ];
    if (jsonData.isNotEmpty) {
      List<GroupInfoEntity> list = [];

      for (int i = 0; i < jsonData.length; i++) {
        list.add(GroupInfoModel.fromJson(jsonData.elementAt(i)));
      }

      return list;
    } else {
      throw ServerException("Ошибка");
    }
  }

  @override
  Future<GroupInfoByIdEntity> getGroupById(String id) async {
    var jsonData = {
      "id": 4,
      "name": "Талгар-Английский-1",
      "teacher": "Талгар Тилекматов",
      "subject": "Ментальная арифметика"
    };
    if (jsonData.isEmpty) {
      GroupInfoByIdEntity groupInfoByIdEntity =
          GroupInfoByIdModel.fromJson(jsonData);
      return groupInfoByIdEntity;
    } else {
      throw ServerException("Ошибка");
    }
  }

  @override
  createHWByStudentId() {
    // TODO: implement createHWByStudentId
    throw UnimplementedError();
  }

  @override
  deleteHWById() {
    // TODO: implement deleteHWById
    throw UnimplementedError();
  }

  @override
  deleteHWByStudentId() {
    // TODO: implement deleteHWByStudentId
    throw UnimplementedError();
  }

  @override
  getAllHW() {
    // TODO: implement getAllHW
    throw UnimplementedError();
  }

  @override
  getAllHWByStudentId() {
    // TODO: implement getAllHWByStudentId
    throw UnimplementedError();
  }

  @override
  getAllLessonHistory() {
    // TODO: implement getAllLessonHistory
    throw UnimplementedError();
  }

  @override
  getLastThreeLessonHistory() {
    // TODO: implement getLastThreeLessonHistory
    throw UnimplementedError();
  }

  @override
  postAttendanceStudents() {
    // TODO: implement postAttendanceStudents
    throw UnimplementedError();
  }

  @override
  postGradeByStudentsId() {
    // TODO: implement postGradeByStudentsId
    throw UnimplementedError();
  }
}
