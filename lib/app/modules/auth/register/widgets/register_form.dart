part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final controller = Modular.get<RegisterController>();

  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CuidapetTextFormField(
              label: 'Login',
              controller: _loginEC,
              validator: Validatorless.multiple([
                Validatorless.required('Login obrigatório'),
                Validatorless.email('Login deve ser um e-mail válido'),
              ]),
            ),
            SizedBox(height: 20.h),
            CuidapetTextFormField(
              label: 'Senha',
              obscureText: true,
              controller: _passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória'),
                Validatorless.min(
                    6, 'Senha precisa ter pelo menos 6 caracteres')
              ]),
            ),
            SizedBox(height: 20.h),
            CuidapetTextFormField(
              label: 'Confirmar Senha',
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Confirma Senha obrigatória'),
                Validatorless.compare(
                    _passwordEC, 'Senha e confirma senha não são iguais')
              ]),
            ),
            SizedBox(height: 20.h),
            CuidapetDefaultButton(
              label: 'Cadastrar',
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;

                if (formValid) {
                  controller.register(
                    email: _loginEC.text,
                    password: _passwordEC.text,
                  );
                }
              },
            )
          ],
        ));
  }
}
