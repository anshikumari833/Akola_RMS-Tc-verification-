   Textfield ____________
  Container(padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text( "Name of Building", style: TextStyle(color: Colors.black87),),
                          Text( " *", style: TextStyle(color: Colors.red),  ),
                          SizedBox( width: 10),
                          Expanded(
                            child: TextField(decoration: InputDecoration(
                                hintText: "Enter the building name",
                              ), ), ), ],),  ),