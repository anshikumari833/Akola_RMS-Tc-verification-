import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Property_AddCluster/views/property_add_cluster_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/property_cluster_controller.dart';

class PropertyClusterView extends GetView<PropertyClusterController> {
  const PropertyClusterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF0F6F9),
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF1F7FC),
          title: Center(
            child: Text("Cluster",style:GoogleFonts.publicSans(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(69, 70, 70, 0.9),
            ),),
          ), actions: [
          SizedBox(width: 10,),
          GestureDetector(onTap: (){Get.to(HomeView());},child: Icon(Icons.home,color: Colors.black,)),
          SizedBox(width: 14,),
        ],),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF0F6F9),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20,right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                           Get.to(PropertyAddClusterView());
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text(' Add'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

               //DETAIL LIST
            Obx(() {
              final filteredList = controller.Detaillists;
              if (controller.isLoading.value) {
                return Container(
                  child: Center(
                    child: SpinKitFadingCircle(
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ),
                );
              }
              if (controller.Detaillists.isEmpty) {
                return Container(
                  child: Center(
                    child: Text("No results found"),
                  ),
                );
              }
              return
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (filteredList.isEmpty || index >= filteredList.length) {
                      return SizedBox.shrink();
                    }
                    return

                    GestureDetector(
                      onTap: () async {},
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        color: const Color(0xFFF0F6F9),
                        child: Column(
                          children: [
                            Container(
                              // height: 225.13,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // bottom: 40.35,
                                    child: Container(
                                      height: 200,
                                      width: size.width * 0.92,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.02),
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Image.asset("assets/images/cluster_img.png"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 19.27),
                                            child: VerticalDivider(
                                              width: 16,
                                              color: Color.fromRGBO(69, 70, 70, 0.2),
                                            ),
                                          ),
                                          // Expanded(
                                          //   flex: 3,
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                          //     child: SingleChildScrollView(
                                          //       child: Column(
                                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          //         crossAxisAlignment: CrossAxisAlignment.start,
                                          //         children: [
                                          //           Text(
                                          //             "Applicant Name  - ${capitalizeFirstLetter(filteredList[index]['name'])}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             "Old Ward No.  -  ${(filteredList[index]['oldWard'])}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             "New Ward No  - ${filteredList[index]['newWardName']}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             "Address  - ${capitalizeFirstLetter(filteredList[index]['address'])}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             "Authorized Person - ${capitalizeFirstLetter(filteredList[index]['authPersonName'])}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             "Mobile No.  -   ${filteredList[index]['mobileNo']}",
                                          //             style: GoogleFonts.publicSans(
                                          //               fontWeight: FontWeight.w700,
                                          //               fontSize: 12,
                                          //               fontStyle: FontStyle.normal,
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildDetailsRow('Old Ward No - ', capitalizeFirstLetter(filteredList[index]['oldWard'].toString())),
                                  _buildDetailsRow('New Ward No - ', capitalizeFirstLetter(filteredList[index]['newWardName'].toString())),
                                  _buildDetailsRow('Name  - ', capitalizeFirstLetter(filteredList[index]['name'].toString())),
                                  _buildDetailsRow('Type - ', capitalizeFirstLetter(filteredList[index]['type'].toString())),
                                  _buildDetailsRow('Mobile No - ', capitalizeFirstLetter(filteredList[index]['mobileNo'].toString())),
                                  _buildDetailsRow('Address - ', capitalizeFirstLetter(filteredList[index]['address'].toString())),
                                  _buildDetailsRow('Authorized \nPerson - ', capitalizeFirstLetter(filteredList[index]['authPersonName'].toString())),
                                ],
                              ),
                            ),
                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
              ),
                );
            })
         ],
            ),
          ),
        )
    );
  }
}


Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical:0,horizontal:0),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:0),
          child: Text(
            label,
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontStyle:
                FontStyle.normal),
          ),
        ),
        Flexible(
          child: Text(
            value.isNotEmpty ? value : 'N/A',
            style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontStyle:
                FontStyle.normal),
          ),
        ),
      ],
    ),
  );
}


String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;

  final List<String> words = text.split(' ');

  for (int i = 0; i < words.length; i++) {
    final String word = words[i];
    if (word.isNotEmpty) {
      final String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      words[i] = capitalizedWord;
    }
  }

  return words.join(' ');
}