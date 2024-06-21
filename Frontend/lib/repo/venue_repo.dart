import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:leo_futsal/models/orders.dart';
import 'package:leo_futsal/models/venue.dart';
import 'package:leo_futsal/utils/api.dart';
import 'package:leo_futsal/utils/storage_helper.dart';

class VenueRepo {
  static Future<void> getAllVenues(
      {required Function(List<Venue>) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("on sucess ma aayo ");
      var token = StorageHelper.getToken();
      var url = Uri.parse(LeoApi.venue);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      print(data.toString());
      if (data['status']) {
        log("on sucess ma aayo ");
        onSuccess(venueListFromJson(data['data']['venues']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }

  static Future<void> getAllHistory(
      {required Function(List<Order>) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("on sucess ma aayo ");
      var token = StorageHelper.getToken();
      var url = Uri.parse(LeoApi.viewOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);
      if (data['status']) {
        onSuccess(orderListFromJson(data['data']['orders']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
