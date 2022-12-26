import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://127.0.0.1:5001';
class API {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Content-Type': 'text/html; charset=utf-8',
    };

    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}