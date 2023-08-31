import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/icons/cuidapet_icons.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_button_with_icon.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

part './widgets/login_form.dart';
part './widgets/login_register_buttons.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final testeEC = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.h),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 162.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20.h),
                const _LoginForm(),
                SizedBox(height: 15.h),
                const _OrDivider(),
                SizedBox(height: 15.h),
                const _LoginRegisterButtons(),
              ],
            )),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Text(
            'OU',
            style: TextStyle(
                color: context.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
