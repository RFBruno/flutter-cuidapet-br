import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/icons/cuidapet_icons.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_text_form_field.dart';
    
class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final testeEC = TextEditingController();

  LoginPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CuidapetTextFormField(
                label: 'Login',
                obscureText: true,
                controller: testeEC,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Obrigatorio';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}