import 'dart:convert';

import 'package:blocapp/Model/Post.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:http/http.dart';

class Network {
  static String BASE = "60a54363c0c1fd00175f39f7.mockapi.io";
  static Map<String,String> headers = {
    'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "/api/famly";
  static String API_CREATE = "/api/famly";
  static String API_UPDATE = "/api/famly"; //{id}
  static String API_DELETE = "/api/famly/"; //{id}

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    // print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, dynamic> paramsCreate(User post) {
    Map<String, String> params = new Map();
    params.addAll({
      'title': post.name,
      'body': post.fullname,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'title': post.fullname,
      'body': post.name,
    });
    return params;
  }

  /* Http Parsing */

  static List<User> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<User>.from(json.map((x) => User.fromJson(x)));
    return data;
  }

}