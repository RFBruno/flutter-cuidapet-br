part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        CuidapetButtonWithIcon(
          onTap: () {},
          width: .42.sw,
          color: const Color(0xFF4267B3),
          icon: Cuidapet.facebook,
          label: 'Facebook',
        ),
        CuidapetButtonWithIcon(
          onTap: () {},
          width: .42.sw,
          color: const Color(0xFFE15031),
          icon: Cuidapet.google,
          label: 'Google',
        ),
        CuidapetButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/auth/register');
          },
          width: .42.sw,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Cadastre-se',
        ),
      ],
    );
  }
}