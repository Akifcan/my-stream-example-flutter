import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoModel {
  final String title;
  final String body;

  TodoModel(this.title, this.body);
}

class TodoBloc {
  bool vlaue = true;

  final StreamController<List<TodoModel>> controller =
      StreamController<List<TodoModel>>.broadcast()
        ..add([TodoModel("title", "body")]);

  final StreamController<bool> valController =
      StreamController<bool>.broadcast();

  Stream<List<TodoModel>> get todoStream => controller.stream;
  Stream<bool> get valtream => valController.stream;

  void setVal(val) {
    vlaue = val;
    valController.add(vlaue);
  }

  void getTodos() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    List data = jsonDecode(response.body);
    controller.add(data.map((e) => TodoModel(e['title'], e['body'])).toList());
  }

  void dispose() {
    controller.close();
  }
}
