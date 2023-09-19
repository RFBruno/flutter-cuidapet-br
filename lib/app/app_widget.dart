import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/database/sqlite_adm_connection.dart';
import 'package:flutter_cuidapet_br/app/core/ui/ui_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
  }

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
