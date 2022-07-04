import 'dart:async';

class SplashBloc {
  StreamController<double> controller = StreamController<double>.broadcast()
    ..add(145);
  Stream<double> get sizeStream => controller.stream;

  Future<void> startAnim(double newSize) async {
    await Future.delayed(const Duration(seconds: 1));
    controller.add(newSize);
  }

  void dispose() {
    controller.close();
  }
}
