// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_page.dart';

class _HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  const _HomeSupplierTab({required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(
          homeController: homeController,
        ),
        Expanded(
          child: Observer(
            builder: (_) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? _HomeSupplierList(homeController)
                    : const _HomeSupplierGrid(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;
  const _HomeTabHeader({required this.homeController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text('Estabelecimentos'),
          const Spacer(),
          InkWell(
            onTap: () =>
                homeController.changeTabSupplier(SupplierPageType.list),
            child: Observer(
              builder: (_) {
                return Icon(
                  Icons.view_headline,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.list
                      ? Colors.black
                      : Colors.grey,
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              return InkWell(
                onTap: () =>
                    homeController.changeTabSupplier(SupplierPageType.grid),
                child: Icon(
                  Icons.view_comfy,
                  color: homeController.supplierPageTypeSelected ==
                          SupplierPageType.grid
                      ? Colors.black
                      : Colors.grey,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  final HomeController _homeController;
  const _HomeSupplierList(
    this._homeController,
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: _homeController.listSupplierByAddress.length,
                (context, index) {
                  final supplier = _homeController.listSupplierByAddress[index];
                  return _HomeSupplierListItemWidget(
                    supplier: supplier,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid();

  @override
  Widget build(BuildContext context) {
    return const Text('Supplier grid');
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  final SupplierNearbyMeModel supplier;
  const _HomeSupplierListItemWidget({
    Key? key,
    required this.supplier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          supplier.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                            Text(
                              "${supplier.distance.toStringAsFixed(2)} km de distancia",
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade100,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  100,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    supplier.logo,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
