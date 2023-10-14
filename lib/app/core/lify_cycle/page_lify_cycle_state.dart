import 'package:flutter/widgets.dart';
import 'package:flutter_cuidapet_br/app/core/lify_cycle/controller_lify_cycle.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class PageLifyCycleState<C extends ControllerLifyCycle,
    P extends StatefulWidget> extends State<P> {
  final controller = Modular.get<C>();

  Map<String, dynamic>? get params => null;

  @override
  void initState() {
    super.initState();
    controller.onInit(params);
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.onReady());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
