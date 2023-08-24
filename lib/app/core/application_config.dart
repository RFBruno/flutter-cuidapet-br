import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cuidapet_br/app/core/environment.dart';
import 'package:flutter_cuidapet_br/firebase_options.dart';

class ApplicationConfig {
  configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseCoreConfig();
    await _loadEnv();
  }

  _firebaseCoreConfig() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> _loadEnv() async {
    await Environment.loadEnv();
  }
}
