import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream/second_page.dart';
import 'package:stream/themeinheritedwidget.dart';
import 'package:stream/todo_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamController<int> controller;
  final bloc = TodoBloc();
  bool active = false;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>();
    bloc.valController.add(false);
    controller.stream.listen((event) {
      print(" - $event");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                bloc.getTodos();
              },
              child: const Text("get"),
            ),
            StreamBuilder<bool>(
                stream: bloc.valtream,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: () {
                      active = !active;
                      bloc.setVal(active);
                    },
                    child: Text("setval - ${snapshot.data}"),
                  );
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SecondPage(bloc: bloc)));
              },
              child: const Text("Reedirect"),
            ),
            StreamBuilder<List<TodoModel>>(
              stream: bloc.todoStream,
              builder: (_, snapshot) {
                return Text(snapshot.data != null
                    ? snapshot.data!.length.toString()
                    : "no data");
              },
            )
          ],
        ));
  }
}
