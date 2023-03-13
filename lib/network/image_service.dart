import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wallcraft/model/imageAPI.dart';

class ImageService {
  static const uri =
      "https://api.unsplash.com/photos/?client_id=UElFp6VVCG2H8doV5ghXU6oUkgL5KCkjBaSjzOgHiXY";
  static var url = Uri.parse(uri);

  static Iterable<imageApi> pareImage(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;
    Iterable<imageApi> image =
        list.map((img) => imageApi.fromJson(img)).toList();
    return image;
  }

  static Future<Iterable<imageApi>> fetchImage() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return compute(pareImage, response.body);
    } else {
      throw Exception("Cant not get photo");
    }
  }
}
