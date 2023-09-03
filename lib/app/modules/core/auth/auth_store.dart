import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cuidapet_br/app/core/helpers/constants.dart';
import 'package:flutter_cuidapet_br/app/core/local_storage/local_storage.dart';
import 'package:flutter_cuidapet_br/app/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;

  AuthStoreBase() : _localStorage = Modular.get<LocalStorage>();

  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_TOKEN_KEY);
    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }

    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        await logout();
      }
    });
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    _userLogged = UserModel.empty();
  }
}
