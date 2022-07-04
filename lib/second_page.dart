import 'package:flutter/material.dart';
import 'package:stream/home.dart';
import 'package:stream/todo_bloc.dart';

class SecondPage extends StatelessWidget {
  final TodoBloc bloc;
  const SecondPage({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(bloc.vlaue.toString());
  }
}
