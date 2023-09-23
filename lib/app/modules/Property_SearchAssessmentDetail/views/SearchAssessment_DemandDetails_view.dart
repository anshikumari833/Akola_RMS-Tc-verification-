import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/cluster.dart';
import '../controllers/property_search_assessment_detail_controller.dart';

class DemandDetailsView extends GetView<SearchAssessmentDetailController> {
  const DemandDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demand Detail"),
        elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text( " Total Pending Year - ",
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.indigoAccent,
                            ),),
                          Text( controller.tax_pendingYears.toString(),
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.indigoAccent,
                            ),),
                          SizedBox(width: 14),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        ),
                        child: Column(

                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' Floor Wise Tax Bifurcation',
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 15,
                                  columns: [
                                    DataColumn(label: buildDecoratedContainer(Text('Built-up Area(Sqmt.)'))),
                                    DataColumn(label: buildDecoratedContainer(Text('   Alv    '))),
                                    DataColumn(label: buildDecoratedContainer(Text('Maintenance %'))),
                                    DataColumn(label: buildDecoratedContainer(Text('Maintenance'))),
                                    DataColumn(label: buildDecoratedContainer (Text('Value After Maintenance'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Aging %'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Aging Amount'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Total Tax Value'))),
                                    DataColumn(label: buildDecoratedContainer( Text('General Tax\n    (30%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Road Tax\n    (3%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax\n        (2%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Water Tax\n    (2%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax\n      (2%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Tree Tax\n        (2%)'))),
                                    // DataColumn(label: buildDecoratedContainer( Text('State Education Tax(%)'))),
                                    DataColumn(label: buildDecoratedContainer( Text('State Education Tax'))),
                                    // DataColumn(label: buildDecoratedContainer( Text('Professional Tax(%)'))),
                                    DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text(' Professional Tax'))),)),
                                  ],
                                  rows: controller.tax_floorsTaxesList.map((floorTax) {
                                    return DataRow(
                                      cells: [
                                        DataCell(buildDecoratedContainer(Text(floorTax['buildupAreaInSqmt'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['alv'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['maintancePerc'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['maintantance10Perc'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['valueAfterMaintance'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['agingPerc'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['agingAmt'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['taxValue'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['generalTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['roadTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['firefightingTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['waterTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax['sewerageTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(floorTax[' treeTax'].toString()))),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['stateEducationTaxPerc'].toString()))),
                                        DataCell(buildDecoratedContainer(Text("${floorTax['stateEducationTax'].toString()} (${floorTax['stateEducationTaxPerc'].toString()}%)"))),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['professionalTaxPerc'].toString()))),
                                        DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text( "${floorTax['professionalTax']} (${floorTax['professionalTaxPerc'].toString()}%)"))),)),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['educationTax']))),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['cleanlinessTax']))),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['treeTax']))),
                                        // DataCell(buildDecoratedContainer(Text(floorTax['isCommercial'].toString()))),

                                      ],
                                    );
                                  }).toList(),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        ),
                        child: Column(

                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' Financial Year Wise Tax Bifurcation',
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 15,
                                  columns: [
                                    DataColumn(label: buildDecoratedContainer(Text('Financial Year '))),
                                    DataColumn(label: buildDecoratedContainer( Text('General Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Road Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Education Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Water Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Tree Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('Professional Tax '))),
                                    DataColumn(label: buildDecoratedContainer( Text('State Education Tax '))),
                                    DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Total Tax '))),)),
                                  ],
                                  rows: controller.tax_fyearWiseTaxesList.map((fyearWiseTax) {
                                    return DataRow(
                                      cells: [
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['fyear'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['generalTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['roadTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['firefightingTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['educationTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['waterTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['cleanlinessTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['sewerageTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['treeTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['professionalTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(fyearWiseTax['stateEducationTax'].toString()))),
                                        DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(fyearWiseTax['totalTax'].toString()))),)),
                                      ],
                                    );
                                  }).toList(),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.cyan.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                        ),
                        child: Column(

                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' Grand Total Tax Bifurcation',
                                    style: GoogleFonts.publicSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              // padding: const EdgeInsets.all(10.0),
                              padding:  EdgeInsets.only(right: 8.0,left: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: 15,
                                  columns: [
                                    DataColumn(label: buildDecoratedContainer( Text('General Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Road Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Firefighting Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Education Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Water Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Clealiness Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Sewarage Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Tree Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('State Education Tax'))),
                                    DataColumn(label: buildDecoratedContainer( Text('Professional Tax'))),
                                    DataColumn(label: Padding(padding: const EdgeInsets.all(8.0), child: Center(child: ( Text('Total Tax '))),)),
                                  ],
                                  rows: [
                                    DataRow(
                                      cells: [
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['generalTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['roadTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['firefightingTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['educationTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['waterTax'].toString().toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['cleanlinessTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['sewerageTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['treeTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['stateEducationTax'].toString()))),
                                        DataCell(buildDecoratedContainer(Text(controller.tax_grandTaxesList[0]['professionalTax'].toString()))),
                                        DataCell(Padding(padding: const EdgeInsets.all(8.0), child: Center(child: (Text(controller.tax_grandTaxesList[0]['totalTax'].toString()))),)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text( " Total Amount - ",
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.pinkAccent,
                            ),),
                          SizedBox(width: 14),
                          Text(controller.tax_payableAmount.toString(),
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.pinkAccent,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text( " Rebate Amount - ",
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.pinkAccent,
                            ),),
                          SizedBox(width: 14),
                          Text( nullToNA(controller.tax_rebateAmount.toString()),
                            style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: Colors.pinkAccent,
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),);
  }
}



Container buildDecoratedContainer(Widget child) {
  return Container(
    padding:  EdgeInsets.only(right: 15.0),
    decoration: BoxDecoration(
      border: Border(right: BorderSide(width: 1, color: Colors.grey)),
    ),
    child: Center(child: child),
  );
}