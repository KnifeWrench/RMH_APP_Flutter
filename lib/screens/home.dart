import 'package:flutter/material.dart';
import '../components/buildappbar.dart';
import '../components/buildlisttile.dart';
import '../components/buildsearchbar.dart';

import 'package:rmh_app_flutter/classes/crime_data_class.dart';

final TextEditingController postcodeInputController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CrimeDataClass>? futureAlbum;

  @override
  void initState() {
    super.initState();
    //Init call to API
    // futureAlbum = fetchAlbum();
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
            //Top Menu
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 50, 10, 15),
            //   child: getAppBar(
            //       viabilityScore),
            // ),
            //Crime Box
            // getListTile(),
            // Search box
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 15),
              child: TextField(
                controller: postcodeInputController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Fetch Data'),
              onPressed: () {
                setState(() {
                  futureAlbum = fetchAlbum(postcodeInputController.text);
                });
              },
            ),
            futureAlbum == null
                ? Container() // Display an empty container or any placeholder you'd like
                : FutureBuilder<CrimeDataClass>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return Text('No data available');
                      } else {
                        return Column(
                          children: <Widget>[
                            Text("Postcode: ${snapshot.data!.pcd}"),
                            Text(
                                "Population: ${snapshot.data!.populationTotal}"),
                            Text("Crime Count: ${snapshot.data!.crimeCount}"),
                            Text(
                                "Prev Crime Count: ${snapshot.data!.previousCrimeCount}"),
                            Text("Delta: ${snapshot.data!.delta}"),
                          ],
                        );
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
