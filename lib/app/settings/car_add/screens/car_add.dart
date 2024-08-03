import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:voltway_mobile/app/settings/car_add/controllers/fetch_car_options.dart';
import 'package:voltway_mobile/core/widgets/navbar.dart';

class CarAdd extends StatefulWidget {
  const CarAdd({super.key});

  @override
  State<CarAdd> createState() => _CarAddState();
}

class _CarAddState extends State<CarAdd> {
  List<Map<String, dynamic>> cars = [];
  Map<String, dynamic>? selectedCar;

  @override
  void initState() {
    super.initState();
    getCars();
  }

  void getCars() {
    getCarOptions().then((value) {
      setState(() {
        cars = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Add car",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 0.2),
        ),
        actions: const [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                "https://www.fairtravel4u.org/wp-content/uploads/2018/06/sample-profile-pic.png"),
          ),
        ],
      ),
      body: SafeArea(
        child: cars.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<Map<String, dynamic>>(
                      hint: const Text("Select a car"),
                      value: selectedCar,
                      onChanged: (Map<String, dynamic>? newValue) {
                        setState(() {
                          selectedCar = newValue;
                        });
                      },
                      items: cars
                          .map<DropdownMenuItem<Map<String, dynamic>>>((car) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: car,
                          child: Text("${car['car_make']} ${car['model']}"),
                        );
                      }).toList(),
                    ),
                    if (selectedCar != null) ...[
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 80,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                    "assets/logo/${selectedCar?["car_make"].toString().toLowerCase()}.png",
                                    width: 100,
                                    height: 70),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          "${selectedCar?['car_make']} ${selectedCar?['model']}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Row(children: <Widget>[
                                        Text(
                                            "Capacity: ${selectedCar?['battery_capacity']} KWh",
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            "Max input Power: ${selectedCar?['max_charging_power']} KWh",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ))
                                      ])
                                    ]),
                              ])),
                    ]
                  ],
                ),
              ),
      ),
    );
  }
}
