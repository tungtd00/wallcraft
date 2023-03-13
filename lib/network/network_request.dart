import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/photo.dart';

class NetworkRequest {
  static const uri = 'https://jsonplaceholder.typicode.com/photos';
  static var url = Uri.parse(uri);

  static Iterable<photo> prasePhotos(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;
    Iterable<photo> photos =
        list.map((model) => photo.fromJson(model)).toList();

    return photos;
  }

  static Future<Iterable<photo>> fetchPhotos() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return compute(prasePhotos, response.body);
    } else {
      throw Exception("Can't get photos");
    }
  }
}
