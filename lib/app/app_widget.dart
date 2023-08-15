import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/ui_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth');
    Modular.setObservers([
      Asuka
          .asukaHeroController //This line is needed for the Hero widget to work
    ]);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp.router(
        title: 'Cuida Pet BR',
        debugShowCheckedModeBanner: false,
        theme: UiConfig.theme,
        builder: Asuka.builder,
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
