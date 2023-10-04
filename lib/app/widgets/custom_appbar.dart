import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Color(0xFFF1F7FC),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF1F7Fc),
            ),
            child: Image.asset("assets/images/logo-1.png",fit: BoxFit.cover,)),
      ),
      title: Text("",style: GoogleFonts.publicSans(
          color: Colors.black,
          fontWeight: FontWeight.w600
      ),
      ),
      actions: [
        SizedBox(width: 10,),
        Icon(Icons.home,color: Colors.black,),
        SizedBox(width: 10,),
        Icon(Icons.notifications_active,color: Colors.black,),
        SizedBox(width: 10,),
        Icon(Icons.logout,color: Colors.black,),
        SizedBox(width: 10,),
      ],
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
