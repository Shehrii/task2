import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task2/contact_info.dart';
import 'package:task2/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  var groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 2"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-33.852, 151.211),
          zoom: 11.0,
        ),
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    [1, 2, 3, 4, 5].map((e) {
      var id = MarkerId(e.toString());
      markers[id] = createMarker(
        placeName: e.toString(),
        position: LatLng(-33.852 + e, 151.211 + e),
        onTap: () => onMarkerTapped(e),
      );
    }).toList();

    setState(() {});
  }

  createMarker(
      {required String placeName,
      required LatLng position,
      Function()? onTap}) {
    return Marker(
      markerId: MarkerId(placeName),
      position: position,
      infoWindow: const InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
      onTap: onTap,
    );
  }

  onMarkerTapped(id) {
    Get.defaultDialog(
      title: "",
      barrierDismissible: true,
      confirm: customDialogButton(
        "Next",
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactInfoScreen(
                selectedValue: groupValue,
              ),
            ),
          );
        },
      ),
      content: Column(
        children: <Widget>[

          RadioListTile(
            value: 0,
            title: customText('Damage'),
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            value: 1,
            title: customText('Missing Part'),
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          RadioListTile(
            value: 2,
            title: customText('Other'),
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void onChanged(int? value) {
    setState(() {
      groupValue = value!;
    });
  }
}
