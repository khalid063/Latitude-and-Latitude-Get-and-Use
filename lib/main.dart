import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latitude and Longitude get and Show'),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 50,),
            Text(
              //'Latitude: $latitudeOfUser',
              'Latitude: ',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50,),
            Text(
              //'Latitude: $longitudeOfUser',
              'Latitude: ',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
              children: [
                SizedBox(height: 50,),
                ElevatedButton(
                  //onPressed: _getUserLocation,
                  onPressed: (){},
                  child: const Text('Get Location'),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: (){},
                  child: const Text('Reset Location'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


