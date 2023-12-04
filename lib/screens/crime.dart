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
      backgroundColor: const Color.fromARGB(255, 226, 29, 29),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
              child: CrimeHeaderCard(data: widget.data),
            ),
            Column(
              children: [
                CrimeArgTableCard(data: widget.data),
                CrimeGeoTableCard(data: widget.data),
                ShortPcdRankingCard(data: widget.data),
                PcdDistrictRankingCard(data: widget.data),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CrimeHeaderCard extends StatelessWidget {
  final CrimeDataClass? data;
  const CrimeHeaderCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.local_police_sharp),
              title: Text('Crime Summary for - ${data!.pcd}'),
              subtitle: Column(
                children: [
                  Text("Crime Count: ${data!.crimeCount}"),
                  Text("Prev Crime Count: ${data!.previousCrimeCount}"),
                  Text("Delta: ${data!.delta}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CrimeArgTableCard extends StatelessWidget {
  final CrimeDataClass? data;
  const CrimeArgTableCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.local_police_sharp),
              title: Text('Types of crimes (CrimeArgTable)'),
              subtitle: Column(
                children: [
                  Text("Summary of something "),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE'),
                  onPressed: () {
                    final result = data;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CrimeAgrTablePage(data: result)),
                    );
                  },
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

class CrimeGeoTableCard extends StatelessWidget {
  final CrimeDataClass? data;
  const CrimeGeoTableCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.local_police_sharp),
              title: Text('Crimes in area (CrimeGeoTable)'),
              subtitle: Column(
                children: [
                  Text("Summary of something "),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE'),
                  onPressed: () {
                    final result = data;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CrimeAgrTablePage(data: result)),
                    );
                  },
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

class ShortPcdRankingCard extends StatelessWidget {
  final CrimeDataClass? data;
  const ShortPcdRankingCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.local_police_sharp),
              title: const Text('Short postcode ranking (shortPcdRanking)'),
              subtitle: Column(
                children: [
                  Text("Crime Count: ${data!.shortPcdRanking?.ranking}"),
                  Text("Crime Count: ${data!.shortPcdRanking?.total}"),
                  Text("Crime Count: ${data!.shortPcdRanking?.rankingDelta}"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE'),
                  onPressed: () {
                    final result = data;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CrimeAgrTablePage(data: result)),
                    );
                  },
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

class PcdDistrictRankingCard extends StatelessWidget {
  final CrimeDataClass? data;
  const PcdDistrictRankingCard({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.local_police_sharp),
              title: const Text('Short postcode ranking (shortPcdRanking)'),
              subtitle: Column(
                children: [
                  Text("Crime Count: ${data!.shortPcdRanking?.ranking}"),
                  Text("Crime Count: ${data!.shortPcdRanking?.total}"),
                  Text("Crime Count: ${data!.shortPcdRanking?.rankingDelta}"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('MORE'),
                  onPressed: () {
                    final result = data;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CrimeAgrTablePage(data: result)),
                    );
                  },
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
