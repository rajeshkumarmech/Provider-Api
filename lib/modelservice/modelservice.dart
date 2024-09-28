//import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class JsonApi {
  final int id;
  final String title;
  final String des;

  JsonApi({required this.id, required this.title, required this.des});

  factory JsonApi.fromjson(Map<String, dynamic> json) {
    return JsonApi(id: json['id'], title: json['title'], des: json['body']);
  }
}

class ServiceJson {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<JsonApi>> getdata() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<JsonApi> data =
          body.map((dynamic item) => JsonApi.fromjson(item)).toList();
      return data;
    } else {
      throw Exception('Failure to fetch');
    }
  }
}
