import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/water_consumer_search_controller.dart';

class RateChartView extends StatelessWidget {
  final controller = Get.find<WaterConsumerSearchController>();

  @override
  Widget build(BuildContext context) {
    final connectionType = controller.searchedConsumerDataById[0]['meterDetails']['ConnectionTypeName'].toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Chart View'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: connectionType == 'Meter'
              ? Container(
                child: Column(
            children: [
                buildMeteredTable(),
                SizedBox(height: 25.0),
                Text(
                  'Note: Consumption up to 10 units per month is free for all categories of users',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                buildTable2(),
            ],
          ),
              )
              : connectionType == 'Fixed'
              ? Container(
            margin: EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
              SizedBox(height: 10.0),
                Text(
                  'For Non-Metered Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                SizedBox(height: 26.0),
                Text(
                  'Note:  The generation of demand statements occurs on a quarterly basis.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 10.0),
                buildFixedTable(),
            ],
          ),
              )
              :  Center(
                child: Container(
            width: 300,
            child: Lottie.asset('assets/lottie/WATER_RateChartError.json'),
          ),
              ),
        ),
      ),
    );
  }

  Widget buildMeteredTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columnSpacing: 16.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          columns: [
            DataColumn(
              label: Container(
                width: 40,
                child: Text('Sl.No.'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 150,
                child: Text('Size of Connection'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 120,
                child: Text('Residential Connection'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 120,
                child: Text('Commercial Consumer'),
              ),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('15 mm (slum)')),
              DataCell(Text('75')),
              DataCell(Text('-')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('15 mm (General)')),
              DataCell(Text('120')),
              DataCell(Text('500')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('20 mm (General)')),
              DataCell(Text('200')),
              DataCell(Text('800')),
            ]),
            DataRow(cells: [
              DataCell(Text('4')),
              DataCell(Text('20 mm (General)')),
              DataCell(Text('400')),
              DataCell(Text('1600')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildFixedTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columnSpacing: 16.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          columns: [
            DataColumn(
              label: Container(
                width: 40,
                child: Text('Sl.No.'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 150,
                child: Text('Size of Connection'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 120,
                child: Text('Residential Connection'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 120,
                child: Text('Commercial Consumer'),
              ),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('15 mm (slum)')),
              DataCell(Text('200')),
              DataCell(Text('-')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('15 mm (General)')),
              DataCell(Text('300')),
              DataCell(Text('1000')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('20 mm (General)')),
              DataCell(Text('500')),
              DataCell(Text('1600')),
            ]),
            DataRow(cells: [
              DataCell(Text('4')),
              DataCell(Text('20 mm (General)')),
              DataCell(Text('1000')),
              DataCell(Text('3200')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildTable2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columnSpacing: 16.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          columns: [
            DataColumn(
              label: Container(
                width: 40,
                child: Text('Sl.No.'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 150,
                child: Text('Category'),
              ),
            ),
            DataColumn(
              label: Container(
                width: 180,
                child: Text('Rate Per Unit'),
              ),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Residential (Slum)')),
              DataCell(Text('Rs.10 Per unit (Per 1000 ltr)'),
              ),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Residential (General)')),
              DataCell(Text('Rs.12 Per unit (Per 1000 ltr)'),
              ),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Commercial')),
              DataCell(Text('Rs.50 Per unit (Per 1000 ltr)'),
              ),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
