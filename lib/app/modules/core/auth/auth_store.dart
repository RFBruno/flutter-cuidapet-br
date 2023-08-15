import 'package:flutter_cuidapet_br/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  
  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    _userLogged = UserModel.empty();

    // await Future.delayed(const Duration(seconds: 2), () {
    //   _userLogged = UserModel.fromMap({'email': 'teste'});
    // },);
  }

}