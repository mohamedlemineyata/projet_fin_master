import 'package:get/get.dart';
import 'package:test1/example/example_model.dart';
import 'package:test1/example/example_service.dart';

class ExampleController extends GetxController {
  List<ExampleModel> examples = [];
  final _service = ExampleService();
  @override
  void onInit() {
    fetchAll();
  }

  void fetchAll() async {
    examples = await _service.getListOfExamples();
    update();
  }
}
