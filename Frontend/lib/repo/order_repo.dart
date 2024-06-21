import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:leo_futsal/utils/api.dart';
import 'package:leo_futsal/utils/storage_helper.dart';

class OrderRepo {
  static Future<void> searchBooking(
      {required String st,
      required String et,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(LeoApi.searchBooking);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": st,
        "end_date": et,
      });
      log(body.toString());
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
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

  static Future<void> postOrder(
      {required String st,
      required String et,
      required String payment,
      required String total,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
//      var url = Uri.parse(LeoApi.searchBooking);

      var url = Uri.parse(LeoApi.postOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": st,
        "end_date": et,
        "payment_method": "khalti",
        "total": "100"
      });
      log(body.toString());
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
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
