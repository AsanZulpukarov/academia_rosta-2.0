import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/home/data/models/attendance_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/create_hw_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/exercise_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/grade_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';

import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/hw_model.dart';
import 'package:academia_rosta_diplom/features/home/data/models/lesson_model.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/grade_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/attendance_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/create_hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/exercise_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/group_info_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/group/hw_entity.dart';
import 'package:academia_rosta_diplom/features/home/domain/entities/lesson_entity.dart';

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
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
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
  Future<GroupInfoByIdModel> getGroupById(int id) async {
    final url =
        Uri.parse('${Constants.baseUrl}api/groups/group-details?groupId=$id');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
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
  Future<HWEntity> createHWByStudentId(CreateHWEntity createHWEntity) async {
    CreateHWModel hwModel = CreateHWModel(
      pupilId: createHWEntity.pupilId,
      groupId: createHWEntity.groupId,
      deadline: createHWEntity.deadline,
    );
    final url = Uri.parse('${Constants.baseUrl}api/homeworks/create');

    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        hwModel.toJson(),
      ),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return HWModel.fromJson(jsonData);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> deleteHWById(int idHW) async {
    final url = Uri.parse('${Constants.baseUrl}api/homeworks/delete');
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll({'homeworkId': idHW.toString()});
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      // final jsonData = jsonDecode(responseBody);
    } else {
      throw ServerException(await response.stream.bytesToString());
    }
  }

  @override
  deleteHWByStudentId() {
    // TODO: implement deleteHWByStudentId
    throw UnimplementedError();
  }

  @override
  Future<List<HWEntity>> getAllHWByStudentId(
      {required int idSubject, required int idStudent}) async {
    final url = Uri.parse(
        '${Constants.baseUrl}api/homeworks/by-pupil?subjectId=$idSubject&pupilId=$idStudent');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return (jsonData as List).map((hw) => HWModel.fromJson(hw)).toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<List<LessonEntity>> getAllLessonHistory(int id) async {
    final url = Uri.parse('${Constants.baseUrl}api/lessons/by-group/$id');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return (jsonData as List)
          .map((lesson) => LessonModel.fromJson(lesson))
          .toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<void> postAttendanceStudents(AttendanceEntity attendanceEntity) async {
    AttendanceModel attendanceModel = AttendanceModel(
      idGroup: attendanceEntity.idGroup,
      attendance: attendanceEntity.attendance,
      selectDate: attendanceEntity.selectDate,
    );
    final url = Uri.parse('${Constants.baseUrl}api/lessons/submit-attendance');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        attendanceModel.toJson(),
      ),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // final jsonData = jsonDecode(responseBody);
    } else {
      throw ServerException(jsonDecode(responseBody)["error"]);
    }
  }

  @override
  Future<void> postGradeByStudentsId(GradeEntity gradeEntity) async {
    GradeModel gradeModel = GradeModel(
      idSubject: gradeEntity.idSubject,
      idStudent: gradeEntity.idStudent,
      rating: gradeEntity.rating,
      gradeType: gradeEntity.gradeType,
      comment: gradeEntity.comment,
    );
    final url = Uri.parse('${Constants.baseUrl}api/marks/create');

    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        gradeModel.toJson(),
      ),
    );
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // final jsonData = jsonDecode(responseBody);
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<List<ExerciseEntity>> getExerciseByHWId(int id) async {
    final url =
        Uri.parse('${Constants.baseUrl}api/homeworks/exercises?homeworkId=$id');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return (jsonData as List)
          .map((exercise) => ExerciseModel.fromJson(exercise))
          .toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }

  @override
  Future<List<GroupInfoEntity>> getGroupsStudentId(int id) async {
    final url = Uri.parse('${Constants.baseUrl}api/groups/by-pupil/$id');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
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
  Future<List<HWEntity>> getHWStudent({required int idSubject}) async {
    final url = Uri.parse(
        '${Constants.baseUrl}api/homeworks/my-homeworks');
    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
      HttpHeaders.authorizationHeader: "Bearer ${Constants.user.token}",
    };

    final response = await http.get(url, headers: headers);
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(responseBody);
      return (jsonData as List).map((hw) => HWModel.fromJson(hw)).toList();
    } else {
      throw ServerException(jsonDecode(responseBody)["message"]);
    }
  }
}
