import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/app_module.dart';
import 'package:flutter_cuidapet_br/app/app_widget.dart';
import 'package:flutter_cuidapet_br/app/core/application_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await ApplicationConfig().configureApp();
  
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
