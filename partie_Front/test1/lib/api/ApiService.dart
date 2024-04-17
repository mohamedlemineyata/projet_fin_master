import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class APIService<T> {
  final Uri url; //non-nullable
  final dynamic body;
  final List<File> files; //non-nullable
  T Function(http.Response response) parse; //non-nullable

  APIService(
      {required this.url, this.body, required this.parse, required this.files});
}

class APIWeb {
  Future<T> get<T>(APIService<T> resource) async {
    final response = await http.get(resource.url); //non-nullable !
    if (response.statusCode == 200) {
      return resource.parse(response); //non-nullable !
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<T> post<T>(APIService<T> resource) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final response = await http.post(resource.url,
        body: jsonEncode(resource.body), headers: headers); //non-nullable !
    if (response.statusCode == 200) {
      return resource.parse(response); //non-nullable !
    } else {
      throw Exception(response.statusCode);
    }
  }

  //File
  Future<T> putFormData<T>(APIService<T> resource) async {
    var request =
        new http.MultipartRequest("PUT", resource.url); //non-nullable !

    resource.body.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    resource.files?.forEach((element) async {
      final file = await http.MultipartFile.fromPath('fileupload', element.path,
          contentType: new MediaType('image', 'jpeg'));
      request.files.add(file);
    });
    final data = await request.send();
    final response = await http.Response.fromStream(data);
    if (response.statusCode == 200) {
      return resource.parse(response); //non-nullable
    } else {
      throw Exception(response.statusCode);
    }
  }
}
