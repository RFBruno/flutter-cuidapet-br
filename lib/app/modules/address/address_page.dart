import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/lify_cycle/page_lify_cycle_state.dart';
import 'package:flutter_cuidapet_br/app/core/mixins/location_mixin.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:flutter_cuidapet_br/app/modules/address/address_controller.dart';
import 'package:flutter_cuidapet_br/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part './widgets/address_item.dart';
part 'widgets/address_search_widget/address_search_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState
    extends PageLifyCycleState<AddressController, AddressPage>
    with LocationMixin {
  final reactionDiposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    final reactionService =
        reaction<bool>((_) => controller.locationServiceUnavailable,
            (locationServiceUnavailable) {
      if (locationServiceUnavailable) {
        showDialogLocationServiceUnavailable();
      }
    });
    final reactionLocationPermission = reaction<LocationPermission?>(
        (_) => controller.locationPermission, (locationPermission) {
      if (locationPermission != null &&
          locationPermission == LocationPermission.denied) {
        showDialogLocationDenied(tryAgain: () => controller.myLocation());
      } else if (locationPermission != null &&
          locationPermission == LocationPermission.deniedForever) {
        showDialogLocationDeniedForever();
      }
    });

    reactionDiposers.addAll([reactionService, reactionLocationPermission]);
  }

  @override
  void dispose() {
    super.dispose();

    for (var reaction in reactionDiposers) {
      reaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: context.primaryColorDark),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Text(
                'Adicione ou escolha um endereço',
                style: context.textTheme.headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return _AddressSearchWidget(
                    key: UniqueKey(),
                    placeModel: controller.placeModel,
                    addressSelectedCallback: (place) {
                      controller.goToAddressDetail(place);
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              ListTile(
                onTap: () => controller.myLocation(),
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Localização atual',
                  style: TextStyle(fontSize: 17.sp),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return Column(
                    children: controller.addresses
                        .map((a) => _ItemTile(
                              address: a.address,
                              onTap: () {
                                controller.selectAddress(a);
                              },
                            ))
                        .toList(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
