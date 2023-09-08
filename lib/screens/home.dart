import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/screens/search.dart';
import '../components/buildappbar.dart';
import '../components/buildlisttile.dart';
import '../components/buildsearchbar.dart';

import 'package:rmh_app_flutter/classes/crime_data_class.dart';

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
                    Text("Postcode: ${widget.data!.pcd}"),
                    Text("Population: ${widget.data!.populationTotal}"),
                    Text("Crime Count: ${widget.data!.crimeCount}"),
                    Text("Prev Crime Count: ${widget.data!.previousCrimeCount}"),
                    Text("Delta: ${widget.data!.delta}"),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
