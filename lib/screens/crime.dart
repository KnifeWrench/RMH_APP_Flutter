import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/screens/crimescreens/crimeagrtable.dart';

import '../../classes/crime_data_class.dart';

class CrimePage extends StatefulWidget {
 CrimeDataClass? data;
 CrimePage({required this.data});

  @override
  State<CrimePage> createState() => _crimePage();
}

class _crimePage extends State<CrimePage> {
    CrimeDataClass? data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 29, 29),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 15),
              child: const Text("CrimePage"),
            ),
                              Text("Postcode: ${widget.data!.pcd}"),
            ElevatedButton(
            child: Text('Crime arg'),
            onPressed: () {final result = widget.data;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CrimeAgrTablePage(data: result)),
              );
            },
          ),],
          ),
        ));
  }
}
