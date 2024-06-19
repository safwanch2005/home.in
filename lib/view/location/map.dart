import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:real_estate_application/view/properties_detail_page/properties_detail_page.dart';

class GMap extends StatefulWidget {
  const GMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  static const LatLng _pGooglePlex = LatLng(11.2676, 75.7729);
  Set<Marker> _markers = {};

  Future<Map<String, double>> getCoordinates(
      String country, String state, String city) async {
    try {
      String address = '$city, $state, $country';
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        return {
          'latitude': location.latitude,
          'longitude': location.longitude,
        };
      } else {
        throw Exception('No locations found for the provided address');
      }
    } catch (e) {
      throw Exception('Failed to get coordinates: $e');
    }
  }

  void _fetchData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('properties')
        .where('hide', isEqualTo: false)
        .where('isAccepted', isEqualTo: 2)
        .where('isSold', isEqualTo: false)
        .get();
    Set<Marker> newMarkers = {};

    for (var doc in snapshot.docs) {
      var data = doc.data();
      var location = data['location'];
      String country = location['country'];
      String state = location['state'];
      String city = location['city'];

      try {
        var coords = await getCoordinates(country, state, city);
        newMarkers.add(
          Marker(
            onTap: () {
              Get.to(PropertiesDetailsPage(propData: data, propId: doc.id));
            },
            markerId: MarkerId(doc.id),
            position: LatLng(coords['latitude']!, coords['longitude']!),
            infoWindow: InfoWindow(title: data['title']),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      } catch (e) {
        print('Error getting coordinates for $city: $e');
      }
    }

    setState(() {
      _markers = newMarkers;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
          const CameraPosition(target: _pGooglePlex, zoom: 15),
      markers: _markers,
    );
  }
}
