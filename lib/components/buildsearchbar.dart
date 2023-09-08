import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:rmh_app_flutter/classes/crime_data_class.dart';

var postCode = 'SN1 4DH';

Widget getSearchBar() {

  return Column(
    children: <Widget>[
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
      ),
      // ElevatedButton(
      //   child: Text("Tap on this"),
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.red,
      //     elevation: 0,
      //   ),
      //   onPressed: () {
      //         // futureAlbum = fetchAlbum();
      //   },
      // ),
    ],
  );
}



Future<CrimeDataClass> fetchAlbum(String postCode) async {
  final response = await http
      .get(Uri.parse('http://192.168.0.99:8082/api/crimedata/'+ postCode));

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