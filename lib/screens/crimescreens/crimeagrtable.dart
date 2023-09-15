import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../classes/crime_data_class.dart';

class CrimeAgrTablePage extends StatefulWidget {
  CrimeDataClass? data;
  CrimeAgrTablePage({required this.data});

  @override
  State<CrimeAgrTablePage> createState() => _crimeAgrTablePage();
}

class _crimeAgrTablePage extends State<CrimeAgrTablePage> {
  CrimeDataClass? data;

  List<CrimeAgrTable> crimeAgrTableData = <CrimeAgrTable>[];
  late CrimeDataClassforTable crimeDataClass;

  @override
  void initState() {
    super.initState();
    data = widget.data;
    crimeAgrTableData = data?.crimeAgrTable ?? <CrimeAgrTable>[];
    crimeDataClass = CrimeDataClassforTable(crimeAgrTable: crimeAgrTableData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 29, 29),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 100, 10, 15),
                child: Text("CrimeAgrTablePage"),
              ),
              SfDataGrid(
                source: crimeDataClass,
                columnWidthMode: ColumnWidthMode.fill,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'Crime Type',
                      label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Crime Type',
                          ))),
                  GridColumn(
                      columnName: 'Crime Count',
                      label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text('Crime Count'))),
                  GridColumn(
                      columnName: 'Diference',
                      label: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Diference',
                            overflow: TextOverflow.ellipsis,
                          ))),
                
                ],
              ),
              // Text("Postcode: ${widget.data!.pcd}"),
            ],
          ),
        ));
  }
}
/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class CrimeDataClassforTable extends DataGridSource {
  /// Creates the employee data source class with required details.
  CrimeDataClassforTable({required List<CrimeAgrTable> crimeAgrTable}) {
    _crimeAgrTable = crimeAgrTable
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'Crime Type', value: e.crimeType),
              DataGridCell<num>(columnName: 'Crime Count', value: e.crimeCount),
              DataGridCell<num>(columnName: 'Diference', value: e.delta),
            ]))
        .toList();
  }

  List<DataGridRow> _crimeAgrTable = [];

  @override
  List<DataGridRow> get rows => _crimeAgrTable;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}