import 'package:flutter_modular/flutter_modular.dart';

mixin ControllerLifyCycle implements Disposable {
  void onInit(Map<String, dynamic>? params) {}

  void onReady() {}

  @override
  void dispose() {}
}
