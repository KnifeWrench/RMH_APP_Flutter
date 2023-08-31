import 'package:flutter/material.dart';
import '../components/buildappbar.dart';
import '../components/buildlisttile.dart';
import '../components/buildsearchbar.dart';

import 'package:rmh_app_flutter/classes/crime_data_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CrimeDataClass> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  var viabilityScore = 690.0;

  

  void _incrementCounter() {
    setState(() {
      viabilityScore = viabilityScore + 10;
    });
  }

  void _decrametCounter() {
    setState(() {
      viabilityScore = viabilityScore - 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Menu
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 15),
              child: getAppBar(
                  viabilityScore, _incrementCounter, _decrametCounter),
            ),
            //Crime Box
            getListTile(),
            // Search box
            getSearchBar(),
            
          ],
        ),
      ),
    );
  }
}