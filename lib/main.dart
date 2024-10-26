import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latitude and Longitude get",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///================================================ All variables ====================================================///
  String latitudeOfUser = '';
  String longitudeOfUser = '';


  ///================================================ Function for get "Let Long" =======================================///
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  // get let long
  Future<void> _getUserLocation() async {
    Position position = await _determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;

    latitudeOfUser = latitude.toString();
    longitudeOfUser = longitude.toString();

    setState(() {

    });

    // Do something with the latitude and longitude, like displaying them or sending them to a server
    print("Latitude: $latitude, Longitude: $longitude");
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lat and Long get and Show'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 50,),
            Text(
              'Latitude: $latitudeOfUser',
              //'Latitude: ',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50,),
            Text(
              'Latitude: $longitudeOfUser',
              //'Latitude: ',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(height: 50,),
                  ElevatedButton(
                    onPressed: _getUserLocation,
                    //onPressed: (){},
                    child: const Text('Get Location'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){
                      latitudeOfUser = "";
                      longitudeOfUser = "";
                      setState(() {

                      });
                    },
                    child: const Text('Reset Location'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


