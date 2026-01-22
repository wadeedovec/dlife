// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getUserAddress(LatLng userCurrentLocation) async {
  // Check for location permission
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    // If permission is denied or deniedForever, handle it appropriately
    return 'Location permission denied';
  }

  // Request permission if not already granted
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Permission was denied again
      return 'Location permission not granted';
    }
  }

  // If permission is granted, proceed to get the address
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        userCurrentLocation.latitude, userCurrentLocation.longitude);

    // Check if placemarks list is not empty and the first placemark is not null
    if (placemarks.isNotEmpty && placemarks[0] != null) {
      // Access placemark properties safely
      String address = placemarks[0].locality ?? '';
      return address.isNotEmpty ? address : 'No address found';
    } else {
      return 'No address found';
    }
  } catch (e) {
    return 'Error: $e';
  }
}
