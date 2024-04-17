import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test1/example/example_model.dart';

class ExampleService {
  Future<List<ExampleModel>> getListOfExamples() async {
    // String url = "http://localhost/:9091/login";
    String url = 'https://jsonplaceholder.typicode.com/todos';

    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return List<ExampleModel>.from(
        json.decode(response.body).map((e) => ExampleModel.fromJson(e)),
      );
      // return ExampleModel.fromJson(
      //   json.decode(response.body),
      // );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
