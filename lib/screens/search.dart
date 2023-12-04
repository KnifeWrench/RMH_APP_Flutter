import 'package:flutter/material.dart';
import 'package:rmh_app_flutter/classes/crime_data_class.dart';
import 'package:rmh_app_flutter/screens/home.dart';
import '../components/buildsearchbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController postcodeInputController = TextEditingController();
  Future<CrimeDataClass>? futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Padding(
              padding: const EdgeInsets.fromLTRB(10, 350, 10, 15),
              child: TextField(
                controller: postcodeInputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ElevatedButton(
            child: const Text('Fetch Data'),
            onPressed: () async {
              futureAlbum = fetchAlbum(postcodeInputController.text);
              final result = await futureAlbum;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(data: result)),
              );
            },
          ),
        ],
      ),
    );
  }
}
