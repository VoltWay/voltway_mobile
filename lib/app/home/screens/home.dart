import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:voltway_mobile/core/widgets/navbar.dart';
import 'package:voltway_mobile/app/settings/car_add/controllers/fetch_car_options.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  List<Map<String, dynamic>> stations = [];
  final LatLng _center = const LatLng(46.677257127835006, 11.186685823901346);

  @override
  void initState() {
    super.initState();
  }

  Future<void> putMarkers() async {
    // Implement this function if needed
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    final markerData = await getMarker();
    setState(() {
      stations = markerData;
    });
    for (var marker in markerData) {
      LatLng pos =
          LatLng(marker["scoordinate"]["y"], marker["scoordinate"]["x"]);
      setState(() {
        markers.add(Marker(
          position: pos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          markerId: MarkerId(Random.secure().nextDouble().toString()),
          infoWindow: InfoWindow(title: marker["sname"]),
        ));
      });
      debugPrint(pos.toString());
    }
    debugPrint("Map created");
  }

  String getPrice(dynamic maxPower) {
    if (maxPower == null || maxPower == -1) {
      return '';
    } else if (maxPower >= 75) {
      return 'Price: 0.89 €/kWh';
    } else {
      return 'Price: 0.65 €/kWh';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Home",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 0.2),
        ),
        actions: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                "https://www.fairtravel4u.org/wp-content/uploads/2018/06/sample-profile-pic.png"),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            SlidingUpPanel(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 50,
              color: const Color.fromARGB(255, 21, 25, 29),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              panel: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      "Charging Stations",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: stations.length,
                        itemBuilder: (context, index) {
                          var station = stations[index];
                          String price = getPrice(station["maxPower"]);
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(15),
                              title: Text(
                                station["sname"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                "Origin: ${station["porigin"]}\nMax Power: ${station["maxPower"]} kWh" +
                                    (price.isNotEmpty ? "\n$price" : ""),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                              leading: const Icon(
                                Icons.ev_station,
                                color: Colors.white,
                                size: 24,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 24,
                              ),
                              onTap: () {
                                // Add onTap functionality if needed
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              backdropEnabled: true,
              backdropOpacity: 0.5,
              backdropTapClosesPanel: true,
              body: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
