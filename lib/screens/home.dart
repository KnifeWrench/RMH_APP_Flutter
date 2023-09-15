// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/classes/crime_data_class.dart';
import 'package:rmh_app_flutter/screens/crime.dart';
import 'package:rmh_app_flutter/screens/crimescreens/crimeagrtable.dart';

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
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 15),
                child: Column(
                  children: [
                    const Text("Home Page"),
                    Text("Postcode: ${widget.data!.pcd}"),
                    Text("Population: ${widget.data!.populationTotal}"),
                    Text("Crime Count: ${widget.data!.crimeCount}"),
                    Text("Prev Crime Count: ${widget.data!.previousCrimeCount}"),
                    Text("Delta: ${widget.data!.delta}"),
                    ElevatedButton(
            child: Text('Crime'),
            onPressed: () {final result = widget.data;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrimePage(data: result)),
              );
            },
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
