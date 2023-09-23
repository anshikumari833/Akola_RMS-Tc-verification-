import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterRateChartView extends GetView {
  const WaterRateChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F6F9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF1F7FC),
        title: Center(
          child: Text(
            "Water Connection",
            style: GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //WCC001
            Container(
              margin: EdgeInsets.all(14.0),
              height: 240,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 140,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC001",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 200,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //=============================
                            //self assessed -1
                            //=============================
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Connection Type - ",
                                    style: GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text("RESIDENTIAL BUILDING WITH HOLDING (OLD PIPE LINE/NEW PIPE LINE) FOR",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "Category - ",
                                    style: GoogleFonts.publicSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(" DOMESTIC APL CATEGORY",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                children: [
                                  // Table rows
                                  TableRow(children: [
                                    TableCell(child: Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),),
                                    ))),
                                    TableCell(child: Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                      ),),
                                    ))),
                                  ]),
                                  TableRow(children: [
                                    TableCell(child: Center(child: Text('0-1000 Square feet'))),
                                    TableCell(child: Center(child: Text('7000.00'))),
                                  ]),
                                  TableRow(children: [
                                    TableCell(child: Center(child: Text('1001-3000 Square feet'))),
                                    TableCell(child: Center(child: Text('14000.00'))),
                                  ]),
                                  TableRow(children: [
                                    TableCell(child: Center(child: Text('3001-5000 Square feet'))),
                                    TableCell(child: Center(child: Text('28000.00'))),
                                  ]),
                                  TableRow(children: [
                                    TableCell(child: Center(child: Text('Above 5000 Square feet'))),
                                    TableCell(child: Center(child: Text('42000.00'))),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC003
            Container(
              margin: EdgeInsets.all(14.0),
              height: 200,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 130,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC003	",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 160,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" RESIDENTIAL BUILDING WITH (OLD PIPE LINE/ NEW PIPE LINE) For",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" DOMESTIC BPL CATEGORY",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text(' Do-	 '))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('00.00'),
                                  ))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC005
            Container(
              margin: EdgeInsets.all(14.0),
              height: 215,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 140,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC005",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 175,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type -",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" APARTMENT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" APARTMENT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text('0-1000 Square feet'))),
                                  TableCell(child: Center(child: Text('7000.00'))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text('1001-3000 Square feet'))),
                                  TableCell(child: Center(child: Text('14000.00'))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text('3001-5000 Square feet'))),
                                  TableCell(child: Center(child: Text('28000.00'))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text('Above 5000 Square feet'))),
                                  TableCell(child: Center(child: Text('42000.00'))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC007
            Container(
              margin: EdgeInsets.all(14.0),
              height: 200,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 130,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC007	",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 160,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" GOVERNMENT / INSTITUTIONAL WITH HOLDING",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" GOVERNMENT / INSTITUTIONAL",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text(' - '))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Rs.26/ Sq.ft.'),
                                  ))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC009
            Container(
              margin: EdgeInsets.all(14.0),
              height: 180,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 120,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC009	",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 140,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" COMMERCIAL WITH HOLDING",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" COMMERCIAL",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text(' - '))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Rs.26/ Sq.ft.'),
                                  ))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC0011
            Container(
              margin: EdgeInsets.all(14.0),
              height: 180,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 120,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC0011	",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 140,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" SSI UNIT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" SSI UNIT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text(' - '))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Rs.26/ Sq.ft.'),
                                  ))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            //WCC0013
            Container(
              margin: EdgeInsets.all(14.0),
              height: 180,
              width: 357,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(142, 145, 147, 0.1),
                    offset: Offset(0,1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 120,
                      width: 357,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0,vertical:9),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate code - WCC0013	",
                                  style: GoogleFonts.publicSans(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  ================================
                  //  second white card
                  //  ================================
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 140,
                      width: 357,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //=============================
                          //self assessed -1
                          //=============================
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Connection Type - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" OTHER THAN SSI UNIT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Category - ",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(" OTHER THAN SSI UNIT",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical:5),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                // Table rows
                                TableRow(children: [
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('BUILT-UP-AREA',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('AMOUNT',style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),),
                                  ))),
                                ]),
                                TableRow(children: [
                                  TableCell(child: Center(child: Text(' - '))),
                                  TableCell(child: Center(child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Rs.26/ Sq.ft.'),
                                  ))),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}
