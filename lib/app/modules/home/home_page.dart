import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/lify_cycle/page_lify_cycle_state.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet_br/app/entities/address_entity.dart';
import 'package:flutter_cuidapet_br/app/models/supplier_category_model.dart';
import 'package:flutter_cuidapet_br/app/modules/home/home_controller.dart';
import 'package:flutter_cuidapet_br/app/modules/home/widgets/home_appbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part './widgets/home_address_widget.dart';
part './widgets/home_categories_widget.dart';
part './widgets/home_supplier_tab.dart';

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
      backgroundColor: Colors.grey[100],
      drawer: const Drawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            HomeAppBar(controller),
            SliverToBoxAdapter(
              child: _HomeAddressWidget(
                controller: controller,
              ),
            ),
            SliverToBoxAdapter(
              child: _HomeCategoriesWidget(
                controller: controller,
              ),
            ),
          ];
        },
        body: _HomeSupplierTab(homeController: controller),
      ),
    );
  }
}
