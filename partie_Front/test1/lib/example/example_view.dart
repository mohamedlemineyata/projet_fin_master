import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/example/example_controller.dart';

class ExampleView extends StatelessWidget {
  static const routeName = '/example-view';
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExampleController>(builder: (controller) {
      final examples = controller.examples;
      return Scaffold(
        body: Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final example = examples[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(example.id.toString()),
                  ),
                  title: Text(example.title ?? ''),
                  trailing: Icon(
                    example.completed! ? Icons.done : Icons.cancel,
                    color: example.completed! ? Colors.green : Colors.red,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: examples.length),
        ),
      );
    });
  }
}
