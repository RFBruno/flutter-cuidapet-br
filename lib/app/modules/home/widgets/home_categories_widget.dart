// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_page.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  final HomeController _controller;
  const _HomeCategoriesWidget({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Observer(
        builder: (_) {
          final categories = _controller.listCategories;
          return Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _CategoryItem(categoryModel: category);
              },
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final SupplierCategoryModel _categoryModel;

  static const categoriesIcons = {
    'P': Icons.pets,
    'V': Icons.local_hospital,
    'C': Icons.store_mall_directory,
  };

  const _CategoryItem({required SupplierCategoryModel categoryModel})
      : _categoryModel = categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: context.primaryColorLight,
            radius: 30,
            child: Icon(
              categoriesIcons[_categoryModel.type],
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(_categoryModel.name)
        ],
      ),
    );
  }
}
