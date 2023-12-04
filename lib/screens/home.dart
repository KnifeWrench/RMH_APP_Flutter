// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/classes/crime_data_class.dart';
import 'package:rmh_app_flutter/screens/crime.dart';
// import 'package:rmh_app_flutter/screens/crimescreens/crimeagrtable.dart';

final TextEditingController postcodeInputController = TextEditingController();

class HomePage extends StatefulWidget {
  CrimeDataClass? data;

  HomePage({required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrimeDataClass? data;

  @override
  void initState() {
    super.initState();
  }

  bool isMyFutureInitialized = false;
  var viabilityScore = 690.0;
  var postCode = 'SN1 4GE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.data != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                child: Column(
                  children: [
                    HomeHeaderCard(data: widget.data),
                    HomeCrimeCard(data: widget.data),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class HomeHeaderCard extends StatelessWidget {
  final CrimeDataClass? data;
  const HomeHeaderCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.wifi_channel),
              title: Text('Home Page Summary'),
              subtitle: Column(
                children: [
                  Text("Postcode: ${data!.pcd}"),
                  Text("Population: ${data!.populationTotal}"),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCrimeCard extends StatelessWidget {
  final CrimeDataClass? data;

  const HomeCrimeCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.local_police),
              title: const Text('Crime Statistics'),
              subtitle: Column(
                children: [
                  Text("Crime Count: ${data!.crimeCount}"),
                  Text("Prev Crime Count: ${data!.previousCrimeCount}"),
                  Text("Delta: ${data!.delta}"),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE'),
                  onPressed: () {final result = data;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CrimePage(data: result)),
                          );},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
