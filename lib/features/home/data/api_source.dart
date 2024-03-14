import 'dart:io';

import 'package:academia_rosta_diplom/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiSource {
  static String token = "";

  static Future<bool> postSignIn({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse('${Constants.baseUrl}auth/sign-in');
      final headers = <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptCharsetHeader: 'utf-8',
        // HttpHeaders.authorizationHeader:
        // StaticVariable.userLoginEntity.token ?? "",
      };
      final body = jsonEncode({
        "username": username,
        "password": password,
      });

      final response = await http.post(url, headers: headers, body: body);

      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(responseBody);
        print("Asan------>${jsonData}");
        token = jsonData["token"]; // Assuming response is JSON
        return true;
      } else {
        print("Asan --> ${response.statusCode} ${responseBody}");
        return false;
      }
    } catch (error) {
      print("Error during sign-in: $error");
      return false;
    }
  }

  static Future<bool> getGroups() async {
    try {
      final url = Uri.parse('${Constants.baseUrl}api/groups');
      final headers = <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptCharsetHeader: 'utf-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      };

      final response = await http.get(url, headers: headers);
      print(response.body);
      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(responseBody);
        print("Asan------>${jsonData}"); // Assuming response is JSON
        return true;
      } else {
        print("Asan --> ${response.statusCode} ${responseBody}");
        return false;
      }
    } catch (error) {
      print("Error during sign-in: $error");
      return false;
    }
  }

  static Future<bool> getGroupById({required String id}) async {
    try {
      final url =
          Uri.parse('${Constants.baseUrl}api/groups/group-details?groupId=$id');
      final headers = <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptCharsetHeader: 'utf-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      };

      final response = await http.get(url, headers: headers);
      print(response.body);
      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(responseBody);
        print("Asan------>${jsonData}"); // Assuming response is JSON
        return true;
      } else {
        print("Asan --> ${response.statusCode} ${responseBody}");
        return false;
      }
    } catch (error) {
      print("Error during sign-in: $error");
      return false;
    }
  }
}
