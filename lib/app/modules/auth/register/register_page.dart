import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter_cuidapet_br/app/modules/auth/register/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

part './widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20.h),
              const _RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}
