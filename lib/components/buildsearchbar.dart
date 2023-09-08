import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:rmh_app_flutter/classes/crime_data_class.dart';

Widget getSearchBar() {
  
  return Column(
    children: <Widget>[
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
      ),
      ElevatedButton(
        child: Text("Tap on this"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        onPressed: () {
          fetchAlbum();
        },
      ),
      // FutureBuilder<CrimeDataClass>(
      //       future: futureAlbum,
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return Text(snapshot.data!.pcd);
      //         } else if (snapshot.hasError) {
      //           return Text('${snapshot.error}');
      //         }

      //         // By default, show a loading spinner.
      //         return const CircularProgressIndicator();
      //       },
      //     ),
    ],
  );
}



Future<CrimeDataClass> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://192.168.0.99:8082/api/crimedata/sn1 4ge'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return CrimeDataClass.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}