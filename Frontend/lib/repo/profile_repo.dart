import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:leo_futsal/utils/api.dart';
import 'package:leo_futsal/utils/storage_helper.dart';

class ProfileRepo {
  static Future<void> changePasswordUser(
      {required String oldPassword,
      required String newPassword,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(LeoApi.changePassword);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json
          .encode({"old_password": oldPassword, "new_password": newPassword});

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status']) {
        log("on sucess ma aayo ");
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
