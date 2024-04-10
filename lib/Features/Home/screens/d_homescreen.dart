// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:trucks/Common/Utils/loader.dart';
import 'package:trucks/Common/Utils/string2.dart';

class DHome extends StatefulWidget {
  const DHome({super.key});

  @override
  State<DHome> createState() => _DHomeState();
}

final homekey = GlobalKey<ScaffoldState>();

class _DHomeState extends State<DHome> {
  final pageIndexNotifier = ValueNotifier(0);
  final locationCtrl = location.Location();
  LatLng destination = const LatLng(6.849775699999999, 7.398720700000001);
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    location.PermissionStatus permissionGranted;

    serviceEnabled = await locationCtrl.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationCtrl.requestService();
    } else {
      return;
    }

    permissionGranted = await locationCtrl.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await locationCtrl.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }

    locationCtrl.onLocationChanged.listen(
      (currentLocation) {
        if (currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          setState(() {
            currentPosition = LatLng(
              currentLocation.latitude!,
              currentLocation.longitude!,
            );
          });
        }
      },
    );
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(currentPosition!.latitude, currentPosition!.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
    } else {
      if (kDebugMode) {
        print("ERROR: ${result.errorMessage}");
      }
      return [];
    }
  }

  Future<void> generatePolylineFromPoints(List<LatLng> poly) async {
    const id = PolylineId("zapper");

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: poly,
      width: 5,
    );

    setState(() {
      polylines[id] = polyline;
    });
  }

  Future<void> fetchAndDrawPolyline() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    await generatePolylineFromPoints(coordinates);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await fetchAndDrawPolyline(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homekey,
      body: currentPosition == null
          ? const Loader()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentPosition!,
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("sourceLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: currentPosition!,
                ),
                Marker(
                  markerId: const MarkerId("destinationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: destination,
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }
}
