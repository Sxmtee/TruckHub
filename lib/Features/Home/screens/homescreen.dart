// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:trucks/Common/Utils/loader.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:trucks/Common/Utils/string2.dart';
import 'package:trucks/Common/Widgets/snackbar.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:trucks/Features/Home/widgets/wolt_dialog.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final homekey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  final pageIndexNotifier = ValueNotifier(0);
  final locationCtrl = location.Location();
  LatLng? destination;
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

  void onError(PlacesAutocompleteResponse response) {
    showSnackBar(context, response.errorMessage!);
  }

  late GoogleMapController googleMapController;

  Future<void> displayPrediction(
    Prediction p,
    ScaffoldState currentState,
  ) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(
      p.placeId!,
    );

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    destination = LatLng(lat, lng);

    setState(() {});

    googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(destination!, 14),
    );

    showSnackBar(context, "Tap on the marker to show available drivers");
  }

  Future<void> handleSearch() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      mode: Mode.overlay,
      onError: onError,
      language: "en",
      strictbounds: false,
      types: [""],
      decoration: const InputDecoration(hintText: "Search places"),
      components: [Component(Component.country, "Ng")],
    );

    if (p != null) {
      await displayPrediction(p, homekey.currentState!);
      await fetchAndDrawPolyline();
    }
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      kGoogleApiKey,
      PointLatLng(currentPosition!.latitude, currentPosition!.longitude),
      PointLatLng(destination!.latitude, destination!.longitude),
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
    const id = PolylineId("zipper");

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
    final coordinates = await fetchPolylinePoints();
    generatePolylineFromPoints(coordinates);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => await fetchLocationUpdates(),
    );
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homekey,
      body: currentPosition == null
          ? const Loader()
          : Stack(
              children: [
                GoogleMap(
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
                      position: destination == null
                          ? const LatLng(37.3861, -122.0839)
                          : destination!,
                      onTap: () {
                        WoltModalSheet.show(
                          pageIndexNotifier: pageIndexNotifier,
                          context: context,
                          pageListBuilder: (modal) {
                            return [
                              page1(context, pageIndexNotifier),
                            ];
                          },
                        );
                      },
                    ),
                  },
                  onMapCreated: (controller) {
                    googleMapController = controller;
                  },
                  polylines: destination == null
                      ? {}
                      : Set<Polyline>.of(polylines.values),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: handleSearch,
                      child: const Text("Search Places & Book a Driver"),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
