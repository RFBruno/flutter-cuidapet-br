// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/size_screen_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet_br/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:flutter_cuidapet_br/app/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressDetailPage extends StatefulWidget {
  final PlaceModel place;

  const AddressDetailPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  @override
  Widget build(BuildContext context) {
    var position = LatLng(
      widget.place.lat,
      widget.place.lng,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: context.primaryColor),
      ),
      body: Column(
        children: [
          Text(
            'Confirme seu endreço',
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: position,
                zoom: 16,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('AddressID'),
                  position: position,
                  infoWindow: InfoWindow(
                    title: widget.place.address,
                  ),
                ),
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.place.address,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Endereço',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Complemento',
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: .9.sw,
            height: 60.h,
            child: CuidapetDefaultButton(
              label: 'Salvar',
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
