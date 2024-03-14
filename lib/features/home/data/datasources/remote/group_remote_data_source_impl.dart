import 'dart:convert';
import 'dart:io';

import 'package:academia_rosta_diplom/core/error/exception.dart';
import 'package:academia_rosta_diplom/features/home/data/models/group_info_by_id_model.dart';

import 'package:academia_rosta_diplom/features/home/data/models/group_info_model.dart';

import '../../../../../constants.dart';
import 'group_remote_data_source.dart';

import 'package:http/http.dart' as http;

class GroupRemoteDataSourceImpl extends GroupRemoteDataSource {
  GroupRemoteDataSourceImpl();
  @override
  Future<List<GroupInfoModel>> getAllGroups() async {
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
}
