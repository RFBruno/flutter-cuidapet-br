part of '../address_page.dart';

class _AddressSearchWidget extends StatefulWidget {
  const _AddressSearchWidget();

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
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

  FutureOr<Iterable<PlaceModel>> _suggestionsCallback(String pattern) {
    log('Endereço digitado $pattern');
    return [PlaceModel(address: 'Av paulista, 200', lat: 100, lng: 200)];
  }

  void _onSuggestionSelected(suggestion) {}
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
