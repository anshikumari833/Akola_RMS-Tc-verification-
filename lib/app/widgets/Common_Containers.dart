import 'package:flutter/material.dart';

Widget common_CollectionContainer(Color color, IconData iconData, String text1, String text2) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: 10),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    text2,
                    style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Widget common_CollectionContainer(Color borderColor, String text1, String text2) {
// Widget common_CollectionContainer(Color color, String text1, String text2) {
//   return Expanded(
//     child: Container(
//       decoration: BoxDecoration(
//         color: color,
//         // border: Border.all(
//         //   color: borderColor,
//         //   width: 2.0,
//         // ),
//       ),
//       padding: EdgeInsets.all(5.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.star,
//                 color: Colors.black,
//               ),
//               SizedBox(width: 10), // Add spacing between the icon and text
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     text1,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(height: 5), // Add spacing between the texts
//                   Text(
//                     text2,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       )
//     ),
//   );
// }

// common_CollectionContainer(Color(0xFF7e0f2f1), 'Total Transaction', ''),