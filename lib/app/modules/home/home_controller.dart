import 'dart:developer';

import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifyCycle {
  @override
  Future<void> onReady() async {
    log('onReady chamado');
    await _hasRegistredAddress();
  }

  Future<void> _hasRegistredAddress() async {}
}
