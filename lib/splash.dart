import 'package:flutter/material.dart';
import 'package:stream/home.dart';
import 'package:stream/splash_bloc.dart';

class Splassh extends StatefulWidget {
  const Splassh({Key? key}) : super(key: key);

  @override
  State<Splassh> createState() => _SplasshState();
}

class _SplasshState extends State<Splassh> {
  final bloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.startAnim(MediaQuery.of(context).size.width * .5);
      bloc.controller.stream.listen((event) {
        Future.delayed(const Duration(seconds: 1)).then((_) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const Home()));
        });
      });
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<double>(
          stream: bloc.sizeStream,
          builder: (context, snapshot) {
            return Center(
              child: FlutterLogo(
                curve: Curves.easeOut,
                size: snapshot.data,
              ),
            );
          }),
    );
  }
}
