import 'dart:developer';

import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifyCycle {
  @override
  void onInit(Map<String, dynamic>? params) {
    log('onInit chamado');
    log('$params');
  }

  @override
  void onReady() {
    log('onReady chamado');
  }
}
