import 'package:flutter/material.dart';

Widget getListTile() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2, 7, 2, 0),
    child: SizedBox(
      height: 80.0,
      child: Card(
        color: Colors.white,
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/Crime_logo_placeholder.png'),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 5, 2, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Crime Score',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 1, 2, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '123',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Crime Score',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}