import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Form(
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
                CuidapetTextFormField(label: 'Login'),
                SizedBox(height: 20.h),
                CuidapetTextFormField(
                  label: 'Senha',
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                CuidapetTextFormField(
                  label: 'Confirmar Senha',
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                CuidapetDefaultButton(
                  label: 'Cadastrar',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
