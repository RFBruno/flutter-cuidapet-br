// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../address_page.dart';

typedef AddressSelectedCallback = void Function(PlaceModel);

class _AddressSearchWidget extends StatefulWidget {
  final AddressSelectedCallback addressSelectedCallback;
  final PlaceModel? placeModel;

  const _AddressSearchWidget({
    Key? key,
    required this.addressSelectedCallback,
    required this.placeModel,
  }) : super(key: key);

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  final searchTextEC = TextEditingController();
  final searchTextFN = FocusNode();

  final controller = Modular.get<AddressSearchController>();

  @override
  void initState() {
    super.initState();
    if (widget.placeModel != null) {
      searchTextEC.text = widget.placeModel?.address ?? '';
      searchTextFN.requestFocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    searchTextEC.dispose();
    searchTextFN.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
    );

    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TypeAheadFormField<PlaceModel>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: searchTextEC,
          focusNode: searchTextFN,
          cursorColor: context.primaryColorDark,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              color: context.primaryColorDark,
            ),
            hintText: 'Insira um endereço',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: context.primaryColorDark),
            ),
            border: border,
            disabledBorder: border,
            enabledBorder: border,
          ),
        ),
        itemBuilder: (_, itemData) {
          log('$itemData');
          return _ItemTile(address: itemData.address);
        },
        onSuggestionSelected: _onSuggestionSelected,
        suggestionsCallback: _suggestionsCallback,
      ),
    );
  }

  Future<List<PlaceModel>> _suggestionsCallback(String pattern) async {
    if (pattern.isNotEmpty) {
      return controller.searchAddress(pattern);
    }
    return <PlaceModel>[];
  }

  void _onSuggestionSelected(suggestion) {
    searchTextEC.text = suggestion.address;
    widget.addressSelectedCallback(suggestion);
  }
}

class _ItemTile extends StatelessWidget {
  final String address;

  const _ItemTile({required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
