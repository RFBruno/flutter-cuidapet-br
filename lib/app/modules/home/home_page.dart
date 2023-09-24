import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/lify_cycle/page_lify_cycle_state.dart';
import 'package:flutter_cuidapet_br/app/core/rest_client/rest_client.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/modules/home/home_controller.dart';
import 'package:flutter_cuidapet_br/app/services/address/address_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifyCycleState<HomeController, HomePage> {
  @override
  Map<String, dynamic>? get params => {'teste': 'teste'};

  AddressEntity? addressEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('LOGOUT')),
          TextButton(
            onPressed: () async {
              final categories =
                  await Modular.get<RestClient>().auth().get('/categories/');
            },
            child: const Text(
              'Test refresh token',
            ),
          ),
          TextButton(
            onPressed: () async {
              await Modular.to.pushNamed('/address/');
            },
            child: const Text(
              'Ir para endereço',
            ),
          ),
          TextButton(
            onPressed: () async {
              final address =
                  await Modular.get<AddressService>().getAddressSelected();
              setState(() {
                addressEntity = address;
              });
            },
            child: const Text(
              'Buscar endereço',
            ),
          ),
          Text(addressEntity?.address ?? 'N?A'),
          Text(addressEntity?.additional ?? 'N?A')
        ],
      ),
    );
  }
}
